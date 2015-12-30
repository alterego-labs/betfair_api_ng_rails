require 'spec_helper'

describe BetfairApiNgRails::Api::Connection do
  let(:acc_name) { 'user001' }
  let(:asm) { double(:account_session_manager) }
  let(:account) { BetfairApiNgRails::Account.new(acc_name, 'pass', 'nfl43n7fg834', 'crt', 'key') }
  let(:logger)   { double(:logger) }
  subject(:connection) { described_class.new(acc_name) }

  before do
    allow(BetfairApiNgRails).to receive(:account_session_manager).and_return asm
    BetfairApiNgRails.log = logger
    allow(logger).to receive(:write)
  end

  describe "#request" do
    let(:provider) { double(:provider) }
    let(:parser)   { double(:parser, process: true) }
    let(:response) { double(:response, result: "") }

    before(:each) do
      expect(subject).to receive(:init_parser).and_return parser
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
    it "resets account's ssoid" do
      allow(connection).to receive(:account).and_return account
      expect(BetfairApiNgRails::Api::SessionManager).to receive(:expire_ssoid).with(account)
      connection.expire_provider
    end
  end

  context "private method" do
    describe "#provider" do
      let(:ssoid) { double(:ssoid) }
      let(:app_key) { 'af2f23f23' }

      before do
        allow(subject).to receive(:app_key).and_return app_key
      end

      it "inits new provider" do
        expect(BetfairApiNgRails::Api::Provider).to receive(:new).with ssoid, app_key
        expect(subject).to receive(:request_ssoid).and_return ssoid
        subject.send(:provider)
      end
    end

    describe "#request_ssoid" do
      before do
        allow(connection).to receive(:account).and_return account
      end

      it "requests new ssoid for new connection" do
        expect(BetfairApiNgRails::Api::SessionManager).to receive(:get_ssoid).with(account)
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

    describe '#account' do
      context 'when it is found' do
        it 'returns this one' do
          expect(BetfairApiNgRails).to receive_message_chain(:account_manager, :get).and_return double(:acc, username: :user001)
          connection.send :account
        end
      end

      context 'when it is not found' do
        it 'raises error' do
          expect{
            expect(BetfairApiNgRails).to receive_message_chain(:account_manager, :get).and_return(nil)
            connection.send :account
          }.to raise_error(BetfairApiNgRails::NoAccountProvided)
        end
      end
    end
  end
end
