require 'spec_helper'

module TestModule
  extend BetfairApiNgRails::Api::RequestMethods
end

describe "listEvents request method" do

  it_behaves_like 'simple list filtering request' do

    let(:method_name)  { "list_events" }
    let(:result_class) { BetfairApiNgRails::EventResult }
    let(:result_hash)  { "{\"result\": [{\"marketCount\": 1, \"event\": { \"id\": 1, \"name\": \"Chelsea - PSG\" }}]}" }

  end

end

