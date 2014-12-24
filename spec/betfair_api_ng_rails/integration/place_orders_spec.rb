require 'spec_helper'
require 'pry-nav'

describe "placeOrders request method" do
  let(:method_name) { "place_orders" }
  let(:result_class) { BetfairApiNgRails::PlaceExecutionReport }
  let(:account) { BetfairApiNgRails::Account.new('user001', 'password', '42f2f434f3g43') }
  let(:result_hash) do
    <<-JSON
    {"result":
      {
        "customerRef": "q2f3f",
        "status": "SOME_STATUS",
        "errorCode": "",
        "marketId": "1.112312312",
        "instructionReports":[
          {}
        ]
      }
    }
    JSON
  end
  let(:parameters)   do
    { market_id: '1.111111', customer_ref: 'dqd23d23', instructions: [] }
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
      it { is_expected.not_to be_nil }
      its(:customer_ref) { is_expected.to eq("q2f3f") }
      its(:status) { is_expected.to eq("SOME_STATUS") }
      its(:error_code) { is_expected.to eq("") }
      its(:market_id) { is_expected.to eq("1.112312312") }
      its(:instruction_reports) { is_expected.to_not be_empty }
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
