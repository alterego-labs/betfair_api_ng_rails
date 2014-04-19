require 'spec_helper'

describe BetfairApiNgRails::Api::SessionManager do
  
  subject { described_class }

  describe "#ssoid" do
    
    it "calls fetching ssoid" do
      expect(subject).to receive(:fetch_ssoid)
      subject.ssoid
    end

  end

  describe "#request_ssoid" do
    
    before(:each) { expect(subject).to receive(:ssoid) }

    context 'when no error occured' do
      
      before(:each) { expect(subject).to receive(:has_errors?).and_return false }

      its(:request_ssoid) { is_expected.to eq true }

    end

    context 'when at least one error occured' do
      
      before(:each) { expect(subject).to receive(:has_errors?).and_return true }

      its(:request_ssoid) { is_expected.to eq false }

    end

  end

  describe "#expire_ssoid" do
    
    it "sets instance var ssoid to nil" do
      subject.instance_variable_set :@ssoid, :value
      expect(subject.ssoid).to eq :value
      subject.expire_ssoid
      expect(subject.instance_variable_get(:@ssoid)).to eq nil
    end

  end

  describe "#new_ssoid" do
    
    it "expires ssoid and calls fetching new one" do
      expect(subject).to receive(:expire_ssoid)
      expect(subject).to receive(:ssoid)
      subject.new_ssoid
    end

  end

end