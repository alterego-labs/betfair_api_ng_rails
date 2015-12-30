require 'spec_helper'

describe BetfairApiNgRails::Api::Config do
  subject(:config) { described_class }

  describe "#formatter=" do
    let(:formatter) { double(:formatter) }
    let(:value) { double(:value) }

    it "inits formatter by passed value" do
      expect(BetfairApiNgRails::Api::FormatterFactory).to receive(:initialize_formatter)
        .with(value)
        .and_return formatter
      config.formatter = value
      expect(config.instance_variable_get(:@formatter)).to eq formatter
    end
  end

  describe "#endpoint=" do
    let(:endpoint) { double(:endpoint) }
    let(:value) { double(:value) }

    it "inits endpoint by passed value" do
      expect(BetfairApiNgRails::Api::EndpointFactory).to receive(:call)
        .with(value)
        .and_return endpoint
      config.endpoint = value
      expect(config.endpoint).to eq endpoint
    end
  end

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
