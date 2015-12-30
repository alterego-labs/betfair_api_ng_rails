require 'spec_helper'

describe BetfairApiNgRails::Api::EndpointFactory do
  subject(:factory) { described_class }

  context 'when passed value associated with existing endpoint' do
    context 'when symbol is passed' do
      subject(:endpoint) { factory.call(:uk) }

      it { is_expected.to be_kind_of(BetfairApiNgRails::Api::Endpoints::Uk) }
    end

    context 'when class is passed' do
      subject(:endpoint) { factory.call(BetfairApiNgRails::Api::Endpoints::Italian) }

      it { is_expected.to be_kind_of(BetfairApiNgRails::Api::Endpoints::Italian) }
    end
  end

  context 'when passed value associated with unexisting endpoint' do
    it 'raises InvalidEndpointError' do
      expect{
        factory.call(:unxisted_endpoint)
      }.to raise_error(BetfairApiNgRails::Api::InvalidEndpointError)
    end
  end
end
