require 'spec_helper'

describe BetfairApiNgRails::Api::Config do
  subject(:config) { described_class }

  it { is_expected.to have_attr_accessor :application_key }
  it { is_expected.to have_attr_accessor :ssl_key_filepath }
  it { is_expected.to have_attr_accessor :ssl_crt_filepath }
  it { is_expected.to have_attr_accessor :username }
  it { is_expected.to have_attr_accessor :password }
  it { is_expected.to have_attr_accessor :locale }
  it { is_expected.to have_attr_accessor :formatter }
  it { is_expected.to have_attr_accessor :keep_alive_session }
  it { is_expected.to have_attr_accessor :use_cache }
  it { is_expected.to have_attr_accessor :cache_expire }
  it { is_expected.to have_attr_accessor :proxy_url }
  it { is_expected.to have_attr_accessor :proxy_enable }
  it { is_expected.to have_attr_accessor :go_localuser }
  it { is_expected.to have_attr_accessor :go_filename }
  it { is_expected.to have_attr_accessor :endpoint }

  describe ".load_for_environment" do
    let(:path)   { "path" }
    let(:opts)   { [:opt1] }
    let(:config_hash) { {'env' => { 'opt1' => :val1 }} }

    before do
      stub_const("BetfairApiNgRails::Api::Constants::LOADABLE_CONFIG_OPTIONS", opts)
      allow(YAML).to receive(:load_file).with(path).and_return config_hash
    end

    it "loads config from file and apply it" do
      expect(config).to receive('opt1=').with(:val1)
      config.load_for_environment path, 'env'
    end
  end
end
