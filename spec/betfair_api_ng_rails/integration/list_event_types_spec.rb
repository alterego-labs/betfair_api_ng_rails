require 'spec_helper'

module TestModule
  extend BetfairApiNgRails::Api::RequestMethods
end

describe "listEventTypes request method" do

  let(:method_name) { "list_event_types" }

  context 'when no error occured' do

    it_behaves_like 'request method' do

      let(:result_hash) { "{\"result\": [{\"marketCount\": 1, \"eventType\": { \"id\": 1, \"name\": \"Soccer\" }}]}" }
      let(:parameters)  { {filter: filter} }

      it { is_expected.not_to be_empty }

    end

  end

  context 'when api error occured' do

    it_behaves_like 'request method' do

      let(:result_hash) { "{\"error\":{\"code\":-32700,\"message\":\"DSC-3000\"}}" }
      let(:parameters)  { {filter: filter} }

      it { is_expected.to be_empty }

    end

  end

end

