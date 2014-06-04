require 'spec_helper'

describe BetfairApiNgRails::Api::Caching::ResponseCache do

  let(:method) { :method }
  let(:params) { :params }

  subject(:cache) { described_class.new(method, params) }

  before { allow_any_instance_of(described_class).to receive(:createsig).with(:params).and_return :sig_params }

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
    let(:record)   { double(:record) }

    before do 
      expect(cache).to receive(:create_params).with(response).and_return :create_params
      expect(cache).to receive(:expire_time).and_return :expire_time
    end

    it "saves response in cache" do
      expect(BetfairApiNgRails::Api::Caching::Models::BetfairCache).to receive(:create).with(:create_params).and_return record
      expect(record).to receive(:expire).with :expire_time
      cache.cache! response
    end

  end

  context 'private method' do
    
    describe "#cache_result" do
      
      it "returns result from cache" do
        expect(BetfairApiNgRails::Api::Caching::Models::BetfairCache).to receive(:where).with(method: :method, params: :sig_params).and_return []
        cache.send :cache_result
      end

    end

    describe "#prepare_response" do
      
      let(:cache_result) { double(:cache_result, response: 'some response text') }

      before { allow(cache).to receive(:cache_result).and_return cache_result }

      subject(:response) { cache.send(:prepare_response) }

      it { is_expected.to respond_to(:body) }

      it { is_expected.to respond_to(:code) }

      its(:body) { is_expected.to eq 'some response text' }

      its(:code) { is_expected.to eq '200' }

    end

    describe "#expire_time" do
      
      it "returns time from config" do
        expect(BetfairApiNgRails).to receive_message_chain(:config, :cache_expire).and_return 4
        expect(cache.send(:expire_time)).to eq 4
      end

    end

    describe "#create_params" do
      
      it "returns params for saving cache" do
        expect(cache.send(:create_params, {some: :key})).to eq(method: :method, params: :sig_params, response: "{\"some\":\"key\"}")
      end

    end

  end

end