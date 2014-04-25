require 'spec_helper'

describe BetfairApiNgRails::Api::Connection do
  
  subject { described_class.new }

  describe "#initialize" do
    
    it "requests session identifier" do
      expect_any_instance_of(described_class).to receive(:request_ssoid)
      described_class.new
    end

  end

  describe "#request" do
    
    let(:provider) { double(:provider) }
    let(:parser)   { double(:parser, process: true) }
    let(:response) { double(:response) }

    before(:each) do 
      expect_any_instance_of(described_class).to receive(:request_ssoid) 
      expect(subject).to receive(:init_parser).and_return parser
    end

    it "calls provider's fetch method" do
      expect(subject).to receive(:provider).and_return provider
      expect(provider).to receive(:fetch).with(method: 'method', params: {}).and_return response
      expect(response).to receive(:has_error?).and_return false
      expect(subject).to receive(:hashing).with({}).and_return({})
      subject.request 'method'
    end

  end

  describe "private method" do

    describe "#provider" do
      
      before(:each) { expect_any_instance_of(described_class).to receive(:request_ssoid) }

      it "inits new provider" do
        expect(BetfairApiNgRails::Api::Provider).to receive(:new)
        subject.send(:provider)
      end

    end

    describe "#request_ssoid" do
      
      it "requests new ssoid for new connection" do
        expect(BetfairApiNgRails::Api::SessionManager).to receive(:new_ssoid).at_least(:once)
        subject.send(:request_ssoid)
      end

    end

    describe "#hashing" do
      
      let(:hashalator) { double(:hashalator) }
      let(:params) { double(:params) }

      before(:each) { expect_any_instance_of(described_class).to receive(:request_ssoid) }

      it "hashalators params" do
        expect(BetfairApiNgRails::Api::Hashalator).to receive(:new).with(params).and_return hashalator
        expect(hashalator).to receive(:to_hash)
        subject.send :hashing, params
      end

    end

  end

end