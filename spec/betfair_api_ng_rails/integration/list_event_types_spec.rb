require 'spec_helper'

module TestModule
  extend BetfairApiNgRails::Api::RequestMethods
end

describe "listEventTypes request method" do

  it_behaves_like 'simple list filtering request', 'listEventTypes' do

    let(:method_name)  { "list_event_types" }
    let(:result_class) { BetfairApiNgRails::EventTypeResult }
    let(:result_hash)  { "{\"result\": [{\"marketCount\": 1, \"eventType\": { \"id\": 1, \"name\": \"Soccer\" }}]}" }

  end

end

