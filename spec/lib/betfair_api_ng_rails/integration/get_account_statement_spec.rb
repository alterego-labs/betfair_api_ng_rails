require 'spec_helper'
require 'pry-nav'

describe 'getAccountStatement request method' do
  let(:method_name) { "get_account_statement" }
  let(:result_class) { BetfairApiNgRails::AccountStatementReport }
  let(:account) { BetfairApiNgRails::Account.new('user001', 'password', '42f2f434f3g43') }
  let(:result_hash) do
    <<-'JSON'
    {"result":
      {
        "accountStatement":[
          {
            "refId":"0",
            "itemDate":"2015-01-02T20:32:51.000Z",
            "amount":-100.0,
            "balance":318.58,
            "itemClassData":{"unknownStatementItem":"{\"avgPrice\":1.68,\"betSize\":100.0,\"betType\":\"B\",\"betCategoryType\":\"E\",\"commissionRate\":null,\"eventId\":116857220,\"eventTypeId\":7524,\"fullMarketName\":\"Games 08 January / Florida @ Vancouver/ Moneyline\",\"grossBetAmount\":0.0,\"marketName\":\"Ставки вкл. ОТ\",\"marketType\":\"O\",\"placedDate\":\"2015-01-08T22:09:26.000Z\",\"selectionId\":2109691,\"selectionName\":\"Ванкувер\",\"startDate\":\"0001-01-01T00:00:00.000Z\",\"transactionType\":\"ACCOUNT_DEBIT\",\"transactionId\":0,\"winLose\":\"RESULT_LOST\"}"},
            "legacyData": {"avgPrice":1.68,"betSize":100.0,"betType":"B","betCategoryType":"E","eventId":116857220,"eventTypeId":7524,"fullMarketName":"Games 08 January / Florida @ Vancouver/ Moneyline","grossBetAmount":0.0,"marketName":"Ставки вкл. ОТ","marketType":"O","placedDate":"2015-01-08T22:09:26.000Z","selectionId":2109691,"selectionName":"Ванкувер","startDate":"0001-01-01T00:00:00.000Z","transactionType":"ACCOUNT_DEBIT","transactionId":0,"winLose":"RESULT_LOST"},
            "itemClass":"UNKNOWN"
          }
        ],
        "moreAvailable":false
      },
      "id":1}
    JSON
  end
  let(:parameters)   do
    { }
  end
  let(:logger)       { double(:logger) }

  before(:each) do
    BetfairApiNgRails.config.formatter = nil
    BetfairApiNgRails.log = logger
    allow(logger).to receive(:write)
    allow(BetfairApiNgRails).to receive_message_chain(:account_manager, :get).and_return account
  end

  context 'when no error occured' do
    it_behaves_like 'request method' do
      it { is_expected.to_not be_nil }
      its(:more_available) { is_expected.to be_nil }
      its(:account_statement) { is_expected.to_not be_empty }
    end
  end

  context 'when api error occured' do
    it_behaves_like 'request method' do
      let(:result_hash) { "{\"error\":{\"code\":-32700,\"message\":\"DSC-3000\"}}" }

      it "raise APINGException" do
        expect{ subject }.to raise_error
      end
    end
  end
end
