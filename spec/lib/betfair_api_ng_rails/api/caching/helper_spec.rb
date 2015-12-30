require 'spec_helper'

class TestObject
  include BetfairApiNgRails::Api::Caching::Helper
end

describe BetfairApiNgRails::Api::Caching::Helper do

  subject(:helper) { TestObject.new }

  describe ".createsig" do

    it "creates hex from sigflat result" do
      expect(helper).to receive(:sigflat).with("some").and_return "some-sigflat"
      expect(Digest::MD5).to receive(:hexdigest).with "some-sigflat"
      helper.createsig "some"
    end

    describe 'real tests' do
      
      context 'sigs equal values' do
        
        let(:value1) { {key1: :value2} }
        let(:value2) { {key1: :value2} }

        it 'expects to be equal' do
          val1 = helper.createsig(value1)
          val2 = helper.createsig(value2)
          expect(val1).to eq val2
        end

      end

      context 'sigs different values' do
        
        let(:value1) { {key1: :value2} }
        let(:value2) { {key1: :value3} }

        it 'expects not to be equal' do
          val1 = helper.createsig(value1)
          val2 = helper.createsig(value2)
          expect(val1).not_to eq val2
        end

      end

    end

  end

  describe ".sigflat" do

    subject { helper.sigflat(value) }

    context "when String passed" do

      let(:value) { 'some' }

      it { is_expected.to eq("some") }

    end

    context "when Integer passed" do

      let(:value) { 1 }

      it { is_expected.to eq("1Fixnum") }

    end

    context "when Hash passed" do

      let(:value) { { key: :value } }

      it { is_expected.to eq("{:key=>:value}Hash") }

    end

    context "when Array passed" do

      let(:value) { ["val1", "val2"] }

      it { is_expected.to eq("[\"val1\", \"val2\"]Array") }

    end

  end

end