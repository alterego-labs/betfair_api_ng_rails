require 'spec_helper'

module TestModule
  extend BetfairApiNgRails::Api::RequestMethods
end

describe "listMarketCatalogue request method" do

  it_behaves_like 'simple list filtering request', 'listMarketCatalogue' do

    let(:method_name)  { "list_market_catalogue" }
    let(:result_class) { BetfairApiNgRails::MarketCatalogue }
    let(:result_hash)  { "{\"result\": [{\"marketId\": 1, \"marketName\": \"Madrid\", \"marketStartTime\": \"23-04-2014\", \"description\": \"Madrid\", \"totalMatched\": \"1\"}]}" }

  end

end

