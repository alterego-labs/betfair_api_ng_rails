require 'spec_helper'

module TestModule
  extend BetfairApiNgRails::Api::RequestMethods
end

describe "listCompetitions request method" do

  let(:result_class) { BetfairApiNgRails::CompetitionResult }
  let(:method_name)  { "list_competitions" }
  let(:parameters)   { {filter: filter} }
  let(:result_hash)  { "{\"result\": [{\"marketCount\": 1, \"competition\": { \"id\": 1, \"name\": \"World Cup 2014\" }, \"competitionRegion\": \"BR\"}]}" }

  before(:each) { BetfairApiNgRails.config.formatter = nil }

  context 'when no error occured' do

    it_behaves_like 'request method' do

      it { is_expected.not_to be_empty }

      its(:first) { is_expected.to be_kind_of result_class }

    end

  end

  context 'when api error occured' do

    it_behaves_like 'request method' do

      let(:result_hash) { "{\"error\":{\"code\":-32700,\"message\":\"DSC-3000\"}}" }

      it { is_expected.to be_empty }

    end

  end

  context 'when enabled formatting' do
    
    before(:each) { BetfairApiNgRails.config.formatter = :js_tree }

    it_behaves_like 'request method' do

      it { is_expected.not_to be_empty }

      its(:first) { is_expected.to be_kind_of Hash }

      its('first.keys') { is_expected.to include(:id, :text, :children, :data) }

    end

  end

end

