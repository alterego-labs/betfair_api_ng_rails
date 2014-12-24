require 'spec_helper'

describe BetfairApiNgRails::AccountSession do
  let(:username) { 'user001' }
  let(:ssoid) { 'wgj34g8h39p4hgp3j' }
  let(:opts) { [username, ssoid] }

  subject(:account_session) { described_class.new(*opts) }

  its(:username) { is_expected.to eq username }
  its(:ssoid)    { is_expected.to eq ssoid }
end

