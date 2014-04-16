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

    before(:each) { expect_any_instance_of(described_class).to receive(:request_ssoid) }

    it "calls provider's fetch method" do
      expect(subject).to receive(:provider).and_return provider
      expect(provider).to receive(:fetch).with(method: 'method', params: {}, data: {})
      subject.request 'method'
    end

  end

  describe "private methods" do

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

  end

end