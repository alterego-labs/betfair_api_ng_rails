require 'spec_helper'

describe "listMarketBook request method" do
  it_behaves_like 'simple list filtering request', 'listMarketBook' do
    let(:parameters)   { {market_ids: [1]} }
    let(:method_name)  { "list_market_book" }
    let(:result_class) { BetfairApiNgRails::MarketBook }
    let(:result_hash)  do
      <<-JSON
      {"result":
        [{"marketId": 1, "isMarketDataDelayed": "true"}
      ]}
      JSON
    end
  end
end

