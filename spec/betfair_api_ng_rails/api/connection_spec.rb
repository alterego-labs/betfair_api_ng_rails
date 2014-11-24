require 'spec_helper'

describe BetfairApiNgRails::Api::Connection do
  subject(:connection) { described_class.new }

  describe "#request" do
    let(:provider) { double(:provider) }
    let(:parser)   { double(:parser, process: true) }
    let(:response) { double(:response, result: "") }
    let(:logger)   { double(:logger) }

    before(:each) do
      expect(subject).to receive(:init_parser).and_return parser
      BetfairApiNgRails.log = logger
      allow(logger).to receive(:write)
    end

    it "calls provider's fetch method" do
      expect(subject).to receive(:provider).and_return provider
      expect(provider).to receive(:fetch).and_return response
      expect(response).to receive(:has_error?).and_return false
      allow(subject).to receive(:hashing).with({}).and_return({})
      subject.request 'method'
    end
  end

  describe "#expire_provider" do
    it "resets provider and ssoid" do
      connection.expire_provider
      expect(connection.instance_variable_get(:@_provider)).to be_nil
    end
  end

  context "private method" do
    describe "#provider" do
      let(:ssoid) { double(:ssoid) }

      it "inits new provider" do
        expect(BetfairApiNgRails::Api::Provider).to receive(:new).with ssoid
        expect(subject).to receive(:request_ssoid).and_return ssoid
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

      it "hashalators params" do
        expect(BetfairApiNgRails::Api::Hashalator).to receive(:new).with(params).and_return hashalator
        expect(hashalator).to receive(:to_hash)
        subject.send :hashing, params
      end
    end
  end
end
