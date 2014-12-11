require 'spec_helper'

describe BetfairApiNgRails::Account do
  let(:username) { 'user001' }
  let(:password) { 'some_password' }
  let(:app_key)  { 'n34f73o48fn' }
  let(:opts) { [username, password, app_key] }

  subject(:account) { described_class.new(*opts) }

  its(:username) { is_expected.to eq username }
  its(:password) { is_expected.to eq password }
  its(:app_key)  { is_expected.to eq app_key }
end
