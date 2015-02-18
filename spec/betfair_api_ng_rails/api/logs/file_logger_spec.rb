require 'spec_helper'

describe BetfairApiNgRails::Api::Logs::FileLogger do
  subject(:logger) { described_class.new(root, env) }

  let(:root) { 'root_path_of_rails_app' }
  let(:env)  { 'some_env' }

  describe "#write" do
    let(:file)   { double(:file) }
    let(:string) { "some text" }

    before do
      expect(File).to receive(:open).and_yield file
      expect(logger).to receive(:now_date).and_return 'now_date'
    end

    it "writes passed string to log file" do
      expect(file).to receive(:puts).with("[now_date] - #{string}")
      logger.write string
    end
  end

  describe "private method" do
    describe "#file_path" do
      subject { logger.send(:file_path) }

      it { is_expected.to include root }
      it { is_expected.to include env }
      it { is_expected.to eq "#{root}/log/betfair_api_ng_rails.#{env}.log" }
    end
  end
end
