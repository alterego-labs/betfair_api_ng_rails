require 'spec_helper'

describe BetfairApiNgRails::Account do
  let(:username) { 'user001' }
  let(:password) { 'some_password' }
  let(:app_key)  { 'n34f73o48fn' }
  let(:crt_filepath) { 'cn2i3nc2f32' }
  let(:key_filepath) { 'f23f23f23f' }
  let(:opts) { [username, password, app_key, crt_filepath, key_filepath] }

  subject(:account) { described_class.new(*opts) }

  its(:username) { is_expected.to eq username }
  its(:password) { is_expected.to eq password }
  its(:app_key)  { is_expected.to eq app_key }
  its(:crt_filepath)  { is_expected.to eq crt_filepath }
  its(:key_filepath)  { is_expected.to eq key_filepath }
end
