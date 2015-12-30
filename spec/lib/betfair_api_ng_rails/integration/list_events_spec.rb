require 'spec_helper'

describe "listEvents request method" do
  it_behaves_like 'simple list filtering request', 'listEvents' do
    let(:method_name)  { "list_events" }
    let(:result_class) { BetfairApiNgRails::EventResult }
    let(:result_hash)  do
      <<-JSON
      {"result":
        [{"marketCount": 1, "event": { "id": 1, "name": "Chelsea - PSG" }}
      ]}
      JSON
    end
  end
end

