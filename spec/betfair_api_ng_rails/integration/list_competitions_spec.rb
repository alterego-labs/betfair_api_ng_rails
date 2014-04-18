require 'spec_helper'

module TestModule
  extend BetfairApiNgRails::Api::RequestMethods
end

describe "listCompetitions request method" do

  it_behaves_like 'simple list filtering request' do

    let(:method_name)  { "list_competitions" }
    let(:result_class) { BetfairApiNgRails::CompetitionResult }
    let(:result_hash)  { "{\"result\": [{\"marketCount\": 1, \"competition\": { \"id\": 1, \"name\": \"World Cup 2014\" }, \"competitionRegion\": \"BR\"}]}" }

  end

end

