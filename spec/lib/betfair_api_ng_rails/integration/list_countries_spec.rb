require 'spec_helper'

describe "listCountries request method" do
  it_behaves_like 'simple list filtering request', 'listCountries' do
    let(:method_name)  { "list_countries" }
    let(:result_class) { BetfairApiNgRails::CountryCodeResult }
    let(:result_hash)  do
      <<-JSON
      {"result":
        [{"marketCount": 1, "event": "UA"}
      ]}
      JSON
    end
  end
end

