require 'spec_helper'

describe "listMarketCatalogue request method" do
  it_behaves_like 'simple list filtering request', 'listMarketCatalogue' do
    let(:method_name)  { "list_market_catalogue" }
    let(:result_class) { BetfairApiNgRails::MarketCatalogue }
    let(:result_hash)  do
      <<-JSON
      {"result":
        [{"marketId": 1, "marketName": "Madrid", "marketStartTime": "23-04-2014", "description": "Madrid", "totalMatched": "1", "competition": {"id": 1, "name": "name"}}
      ]}
      JSON
    end

    describe 'checking attribute' do
      context 'competition' do
        it_behaves_like 'request method' do
          subject { TestModule.send(method_name, parameters).first }

          its(:competition)       { is_expected.not_to be_nil }
          its('competition.name') { is_expected.to eq 'name' }
        end
      end
    end
  end
end

