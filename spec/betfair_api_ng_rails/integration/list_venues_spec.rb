require 'spec_helper'

module TestModule
  extend BetfairApiNgRails::Api::RequestMethods
end

describe "listVenues request method" do

  it_behaves_like 'simple list filtering request', 'listVenues' do

    let(:method_name)  { "list_venues" }
    let(:result_class) { BetfairApiNgRails::VenueResult }
    let(:result_hash)  { "{\"result\": [{\"marketCount\": 1, \"venue\": \"Madrid\"}]}" }

  end

end

