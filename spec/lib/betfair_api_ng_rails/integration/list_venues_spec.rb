require 'spec_helper'

describe "listVenues request method" do
  it_behaves_like 'simple list filtering request', 'listVenues' do
    let(:method_name)  { "list_venues" }
    let(:result_class) { BetfairApiNgRails::VenueResult }
    let(:result_hash)  do
      <<-JSON
      {"result": [
        {"marketCount": 1, "venue": "Madrid"}
      ]}
      JSON
    end
  end
end

