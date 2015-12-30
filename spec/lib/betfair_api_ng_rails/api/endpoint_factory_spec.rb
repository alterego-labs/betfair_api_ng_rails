require 'spec_helper'

describe BetfairApiNgRails::Api::EndpointFactory do
  subject(:factory) { described_class }

  context 'when symbol is passed' do
    subject(:endpoint) { factory.call(:uk) }

    it { is_expected.to be_kind_of(BetfairApiNgRails::Api::Endpoints::Uk) }
  end

  context 'when class is passed' do
    subject(:endpoint) { factory.call(BetfairApiNgRails::Api::Endpoints::Italian) }

    it { is_expected.to be_kind_of(BetfairApiNgRails::Api::Endpoints::Italian) }
  end
end
