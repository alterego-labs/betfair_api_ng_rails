require 'spec_helper'

module TestModule
  extend BetfairApiNgRails::Api::RequestMethods
end

describe "listCountries request method" do

  it_behaves_like 'simple list filtering request', 'listCountries' do

    let(:method_name)  { "list_countries" }
    let(:result_class) { BetfairApiNgRails::CountryCodeResult }
    let(:result_hash)  { "{\"result\": [{\"marketCount\": 1, \"event\": \"UA\"}]}" }

  end

end

