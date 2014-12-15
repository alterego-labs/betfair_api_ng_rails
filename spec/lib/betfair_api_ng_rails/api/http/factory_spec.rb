require 'spec_helper'

describe BetfairApiNgRails::Api::Http::Factory do
  let(:account) do
    BetfairApiNgRails::Account.new(
      'user001',
      'password',
      'app_key',
      'crt_filepath',
      'key_filepath'
    )
  end
  let(:requester) { double(:requester) }

  subject(:factory) { described_class }

  describe '.session_requester' do
    before do
      expect(factory).to receive(:create_http_requester)
        .with(BetfairApiNgRails::Api::Constants::LOGIN_URL, false)
        .and_return(requester)
    end

    it 'settings up requester for session' do
      expect(requester).to receive(:set_ssl_files).with 'crt_filepath', 'key_filepath'
      expect(requester).to receive(:set_request_headers)
      expect(requester).to receive(:set_auth_headers).with 'app_key'
      expect(requester).to receive(:set_form_data)
        .with('username' => 'user001', 'password' => 'password')
      factory.session_requester account
    end
  end
end
