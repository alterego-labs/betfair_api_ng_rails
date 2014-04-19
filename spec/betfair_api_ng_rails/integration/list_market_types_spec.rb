require 'spec_helper'

module TestModule
  extend BetfairApiNgRails::Api::RequestMethods
end

describe "listMarketTypes request method" do

  it_behaves_like 'simple list filtering request', 'listMarketTypes' do

    let(:method_name)  { "list_market_types" }
    let(:result_class) { BetfairApiNgRails::MarketTypeResult }
    let(:result_hash)  { "{\"result\": [{\"marketCount\": 1, \"marketType\": \"MATCH_ODDS\"}]}" }

  end

end

