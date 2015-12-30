require 'spec_helper'

describe BetfairApiNgRails::Api::RequestMethod do
  let(:method_name) { 'someMethod' }
  let(:logger)   { double(:logger) }

  subject(:method) { described_class.new(method_name) }

  before do
    BetfairApiNgRails.log = logger
    allow(logger).to receive(:write)
  end

  context 'has attributes' do
    its(:name) { is_expected.to eq(method_name) }
  end

  context 'when method is exists in allowed' do
    before do
      stub_const('BetfairApiNgRails::Api::Constants::ALLOWED_RESOURCES', {betting: [method_name]})
      stub_const('BetfairApiNgRails::Api::Constants::JSON_METHOD', {betting: 'json_method'})
    end

    its(:type) { is_expected.to eq(:betting) }
    its(:allowed?) { is_expected.to be_truthy }
    its(:api_url) { is_expected.to_not eq :no_api_url }
    its(:json_method) { is_expected.to eq('json_method') }
  end

  context 'when method is not exists in allowed' do
    before do
      stub_const('BetfairApiNgRails::Api::Constants::ALLOWED_RESOURCES', {betting: ['someMethod1']})
    end

    its(:allowed?) { is_expected.to be_falsey }
  end
end
