require 'spec_helper'

describe "listCompetitions request method" do
  it_behaves_like 'simple list filtering request', 'listCompetitions' do
    let(:method_name)  { "list_competitions" }
    let(:result_class) { BetfairApiNgRails::CompetitionResult }
    let(:result_hash)  do
      <<-JSON
      {"result":
        [{"marketCount": 1, "competition": { "id": 1, "name": "World Cup 2014" }, "competitionRegion": "BR"}
      ]}
      JSON
    end
  end
end

