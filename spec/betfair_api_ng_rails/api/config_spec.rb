require 'spec_helper'

describe BetfairApiNgRails::Api::Config do
  subject(:object) { described_class }

  describe ".formatter=" do
    let(:formatter) { double(:formatter) }
    let(:value) { double(:value) }

    it "inits formatter by passed value" do
      expect(BetfairApiNgRails::Api::FormatterFactory).to receive(:initialize_formatter)
        .with(value)
        .and_return formatter
      object.formatter = value
      expect(object.instance_variable_get(:@formatter)).to eq formatter
    end
  end

  describe ".load_for_environment" do
    let(:path)   { "path" }
    let(:opts)   { [:opt1] }
    let(:config) { {'env' => { 'opt1' => :val1 }} }

    before do
      stub_const("BetfairApiNgRails::Api::Constants::LOADABLE_CONFIG_OPTIONS", opts)
      allow(YAML).to receive(:load_file).with(path).and_return config
    end

    it "loads config from file and apply it" do
      expect(object).to receive('opt1=').with(:val1)
      object.load_for_environment path, 'env'
    end
  end
end
