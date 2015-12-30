require 'spec_helper'

describe "listEventTypes request method" do
  it_behaves_like 'simple list filtering request', 'listEventTypes' do
    let(:method_name)  { "list_event_types" }
    let(:result_class) { BetfairApiNgRails::EventTypeResult }
    let(:result_hash)  do
      <<-JSON
      {"result":
        [{"marketCount": 1, "eventType": { "id": 1, "name": "Soccer" }}
      ]}
      JSON
    end
  end
end

