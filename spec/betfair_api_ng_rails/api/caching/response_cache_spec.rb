require 'spec_helper'

describe BetfairApiNgRails::Api::Caching::ResponseCache do

  let(:method) { :method }
  let(:params) { :params }

  subject(:cache) { described_class.new(method, params) }

  before { allow_any_instance_of(described_class).to receive(:createsig).with(:params).and_return :sig_params }

  describe ".redis_connection" do
    
    it "initializes connection to redis" do
      expect(Redis).to receive :new
      described_class.redis_connection
    end

  end

  describe "#is_cached?" do
    
    before { expect(cache).to receive(:cache_result).and_return(cache_result) }

    context 'when cache result returns item' do
      
      let(:cache_result) { double }

      its(:is_cached?) { is_expected.to be_truthy }

    end

    context 'when cache result returns no item' do
      
      let(:cache_result) { nil }

      its(:is_cached?) { is_expected.to be_falsey }

    end

  end

  describe "#responser" do
    
    before { expect(cache).to receive(:prepare_response).and_return :response }

    it "returns http responser with cached info" do
      expect(BetfairApiNgRails::Api::Http::Responser).to receive(:new).with(:response)
      cache.responser
    end

  end

  describe "#cache!" do
    
    let(:response) { { some: :key } }
    let(:cache_adapter) { double(:cache_adapter) }

    before do
      allow(cache).to receive(:cache_adapter).and_return cache_adapter
      expect(cache).to receive(:expire_time).and_return 5
    end

    it "saves response in cache" do
      expect(cache_adapter).to receive(:set).with("betfair_api_ng_rails:method:sig_params", "{\"some\":\"key\"}")
      expect(cache_adapter).to receive(:expire).with("betfair_api_ng_rails:method:sig_params", 5)
      cache.cache! response
    end

  end

  context 'private method' do
    
    describe "#cache_result" do

      let(:cache_adapter) { double(:cache_adapter) }

      before { expect(cache).to receive(:cache_adapter).and_return cache_adapter }

      it "returns result from cache" do
        expect(cache_adapter).to receive(:get).with("betfair_api_ng_rails:method:sig_params")
        cache.send :cache_result
      end

    end

    describe "#prepare_response" do
      
      before { allow(cache).to receive(:cache_result).and_return :result }

      subject(:response) { cache.send(:prepare_response) }

      it { is_expected.to respond_to(:body) }

      it { is_expected.to respond_to(:code) }

      its(:body) { is_expected.to eq :result }

      its(:code) { is_expected.to eq '200' }

    end

    describe "#expire_time" do
      
      it "returns time from config" do
        expect(BetfairApiNgRails).to receive_message_chain(:config, :cache_expire).and_return 4
        expect(cache.send(:expire_time)).to eq 4
      end

    end

    describe "#cache_adapter" do
      
      it "returns redis connection" do
        expect(cache).to receive_message_chain(:class, :redis_connection)
        cache.send :cache_adapter
      end

    end

    describe "#cache_key" do
      
      it "returns proper key for cache" do
        expect(cache.send(:cache_key)).to eq "betfair_api_ng_rails:method:sig_params"
      end

    end

  end

end