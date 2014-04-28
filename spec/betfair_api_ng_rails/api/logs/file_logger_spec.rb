require 'spec_helper'

describe BetfairApiNgRails::Api::Logs::FileLogger do
  
  let(:root) { 'root_path_of_rails_app' }
  let(:env)  { 'some_env' }

  subject(:object) { described_class.new(root, env) }

  describe "#write" do
    
    let(:file)   { double(:file) }
    let(:string) { "some text" }

    it "writes passed string to log file" do
      expect(File).to receive(:open).and_yield file
      expect(file).to receive(:write).with(string)
      object.write string
    end

  end

  describe "private method" do
    
    describe "#file_path" do
      
      subject { object.send(:file_path) }

      it { is_expected.to include root }
      it { is_expected.to include env }
      it { is_expected.to eq "#{root}/log/betfair_api_ng_rails.#{env}.log" }

    end

  end

end