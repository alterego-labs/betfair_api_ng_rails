require 'spec_helper'

describe "listMarketTypes request method" do
  it_behaves_like 'simple list filtering request', 'listMarketTypes' do
    let(:method_name)  { "list_market_types" }
    let(:result_class) { BetfairApiNgRails::MarketTypeResult }
    let(:result_hash)  do
      <<-JSON
      {"result":
        [{"marketCount": 1, "marketType": "MATCH_ODDS"}
      ]}
      JSON
    end
  end
end

