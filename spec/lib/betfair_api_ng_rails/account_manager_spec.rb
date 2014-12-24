require 'spec_helper'

describe BetfairApiNgRails::AccountManager do
  let(:account) { BetfairApiNgRails::Account.new('user001', 'password', 'cf23f23') }
  subject(:manager) { described_class.instance }

  it { is_expected.to respond_to :accounts }

  describe '#store' do
    before do
      manager.clear
    end

    it 'stores account in global hash' do
      expect{
        manager.store account
      }.to change(manager.accounts, :count).by 1
    end
  end

  describe '#get' do
    context 'gets account by username' do
      context 'when it exists' do
        before do
          manager.store account
        end

        it 'returns this one' do
          expect(manager.get('user001')).to eq account
        end
      end

      context 'when it not exists' do
        context 'and default exists' do
          before do
            manager.store account
            manager.default 'user001'
          end

          it 'returns it' do
            expect(manager.get('user002')).to eq account
          end
        end

        context 'and no defaults' do
          before do
            manager.clear
          end

          it 'returns nil' do
            expect(manager.get('user002')).to be_nil
          end
        end
      end
    end
  end

  describe '#clear' do
    before do
      manager.store account
    end

    it 'cleares account register' do
      manager.clear
      expect(manager.accounts.count).to eq 0
    end
  end

  describe '#default' do
    it 'sets default account' do
      expect{
        manager.default 'user001'
      }.to_not raise_error
    end
  end
end
