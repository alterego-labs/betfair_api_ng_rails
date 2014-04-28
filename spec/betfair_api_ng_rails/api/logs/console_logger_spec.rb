require 'spec_helper'

describe BetfairApiNgRails::Api::Logs::ConsoleLogger do
  
  subject(:object) { described_class.new }

  describe "#write" do
    
    let(:string) { "some content" }

    it "puts content to console" do
      expect(object).to receive(:puts).with string
      object.write string
    end

  end

end