require 'spec_helper'

describe BetfairApiNgRails::AccountSessionManager do
  let(:session) { BetfairApiNgRails::AccountSession.new('user001', 'nwfh7348ofho3478fh') }
  subject(:manager) { described_class.instance }

  describe '#store' do
    before do
      manager.clear
    end

    it 'stores session in global hash' do
      expect{
        manager.store session
      }.to change(manager.sessions, :count).by 1
    end
  end

  describe '#get' do
    context 'when information for user exists' do
      before do
        manager.store session
      end

      it 'returns it' do
        expect(manager.get('user001')).to_not be_nil
      end
    end

    context 'when information for user not exists' do
      it 'returns nil' do
        expect(manager.get('003')).to be_nil
      end
    end
  end

  describe '#expire' do
    before do
      manager.store session
    end

    it 'removes session of user' do
      expect{
        manager.expire 'user001'
      }.to change(manager.sessions, :count).by -1
    end
  end

  describe '#clear' do
    before do
      manager.store session
    end

    it 'cleares sessions register' do
      manager.clear
      expect(manager.sessions.count).to eq 0
    end
  end
end
