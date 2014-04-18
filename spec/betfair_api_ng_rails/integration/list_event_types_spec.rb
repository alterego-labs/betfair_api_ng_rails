require 'spec_helper'

module TestModule
  extend BetfairApiNgRails::Api::RequestMethods
end

describe "listEventTypes request method" do

  let(:method_name) { "list_event_types" }
  let(:parameters)  { {filter: filter} }

  context 'when no error occured' do

    it_behaves_like 'request method' do

      let(:result_hash) { "{\"result\": [{\"marketCount\": 1, \"eventType\": { \"id\": 1, \"name\": \"Soccer\" }}]}" }

      it { is_expected.not_to be_empty }

      its(:first) { is_expected.to be_kind_of BetfairApiNgRails::EventTypeResult }

    end

  end

  context 'when api error occured' do

    it_behaves_like 'request method' do

      let(:result_hash) { "{\"error\":{\"code\":-32700,\"message\":\"DSC-3000\"}}" }

      it { is_expected.to be_empty }

    end

  end

end

