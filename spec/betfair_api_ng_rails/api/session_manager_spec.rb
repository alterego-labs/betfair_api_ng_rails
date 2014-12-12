require 'spec_helper'

describe BetfairApiNgRails::Api::SessionManager do
  let(:username) { 'user001' }
  let(:asm) { double(:account_session_manager) }
  let(:account) { BetfairApiNgRails::Account.new(username, 'password', '3cnt4ngt8oh3co', 'crt', 'key') }

  subject(:session_manager) { described_class }

  before do
    allow(BetfairApiNgRails).to receive(:account_session_manager).and_return asm
  end

  describe '.get_ssoid' do
    before do
      allow(BetfairApiNgRails).to receive_message_chain(:account_session_manager, :get).and_return ssoid
    end

    context 'when ASM has ssoid for passed account' do
      let(:ssoid) { '2mf348f3fm3f3' }

      it 'returns this one' do
        expect(session_manager.get_ssoid(account)).to eq ssoid
      end
    end

    context 'when ASM has not ssoid' do
      let(:ssoid) { nil }

      it 'requests new ssoid and returns it' do
        expect_any_instance_of(BetfairApiNgRails::Api::SessionManager::SsoidRequester).to receive(:session_token).and_return ssoid
        expect(asm).to receive(:store)
        expect(session_manager.get_ssoid(account)).to eq ssoid
      end
    end
  end

  describe '.expire_ssoid' do
    it 'expires ssoid for passed account' do
      expect(asm).to receive(:expire).with username
      session_manager.expire_ssoid account
    end
  end
end
