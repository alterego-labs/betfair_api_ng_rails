require 'spec_helper'

describe BetfairApiNgRails::Api::RequestMethod do
  let(:method_name) { 'someMethod' }

  subject(:method) { described_class.new(method_name) }

  context 'has attributes' do
    its(:name) { is_expected.to eq(method_name) }
  end

  context 'when method is exists in allowed' do
    before do
      stub_const('BetfairApiNgRails::Api::Constants::ALLOWED_RESOURCES', {betting: [method_name]})
      stub_const('BetfairApiNgRails::Api::Constants::API_URL', {betting: 'api_url'})
      stub_const('BetfairApiNgRails::Api::Constants::JSON_METHOD', {betting: 'json_method'})
    end

    its(:type) { is_expected.to eq(:betting) }
    its(:allowed?) { is_expected.to be_truthy }
    its(:api_url) { is_expected.to eq('api_url') }
    its(:json_method) { is_expected.to eq('json_method') }
  end

  context 'when method is not exists in allowed' do
    before do
      stub_const('BetfairApiNgRails::Api::Constants::ALLOWED_RESOURCES', {betting: ['someMethod1']})
      stub_const('BetfairApiNgRails::Api::Constants::API_URL', {betting: 'api_url'})
    end

    its(:type) { is_expected.to eq(:no_type) }
    its(:allowed?) { is_expected.to be_falsey }
    its(:api_url) { is_expected.to eq(:no_api_url) }
    its(:json_method) { is_expected.to eq(:no_method) }
  end
end
