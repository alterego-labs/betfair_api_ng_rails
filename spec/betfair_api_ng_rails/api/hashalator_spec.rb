require 'spec_helper'

describe BetfairApiNgRails::Api::Hashalator do
  
  let(:hashable) { { some_key: :some_value } }

  subject { described_class.new(hashable) }

  its(:hashable) { is_expected.to eq hashable }

  describe "#to_hash" do
    
    it "iterates though elements and process they" do
      expect(subject).to receive(:hash_key).at_least(:once)
      expect(subject).to receive(:hash_value).at_least(:once)
      subject.to_hash
    end

  end

  describe "private method" do
    
    describe "#hashing_val" do
      
      let(:el) { double(:el) }

      context 'when array passed' do

        let(:array) { [el] }

        it "calls hash_value on each element" do
          expect(subject).to receive(:hash_value).with(el)
          subject.send :hashing_val, array
        end

      end

      context 'when single value passed' do
        
        it "calls to_hash on it" do
          expect(el).to receive(:to_hash)
          subject.send :hashing_val, el
        end

      end

    end

    describe "#hash_key" do
      
      it "returns key for api request hash" do
        expect(subject.send(:hash_key, :some_key)).to eq 'someKey'
      end

    end

    describe "#need_to_hash?" do
    
      before { stub_const("BetfairApiNgRails::Api::Data::Constants::ATTRS_AS_IS", classes) }

      context 'when ATTRS_AS_IS include value class' do
        
        let(:classes) { [String] }

        it "returns false" do
          expect(subject.send(:need_to_hash?, 'value')).to eq false
        end

      end

      context 'when ATTRS_AS_IS not include value class' do
        
        let(:classes) { [String] }

        it "returns true" do
          expect(subject.send(:need_to_hash?, 1)).to eq true
        end

      end

    end

    describe "#hash_value" do
      
      let(:value) { double(:value) }

      context 'when need to hashing value' do
        
        before { expect(subject).to receive(:need_to_hash?).with(value).and_return(true) }

        it "calls to_hash on value" do
          expect(subject).to receive(:hashing_val).with(value)
          subject.send :hash_value, value
        end

      end

      context 'when dont need to hashing value' do
        
        before { expect(subject).to receive(:need_to_hash?).with(value).and_return(false) }

        it "returns value" do
          expect(subject).to receive(:hashing_val).with(value).exactly(0).times
          subject.send :hash_value, value
        end

      end

    end

  end

  context 'integration tests' do
    
    subject { described_class.new(hashable).to_hash }

    context 'when only simple values passed' do
      
      let(:hashable) { { some_key: :some_value } }

      it { is_expected.to eq({'someKey' => :some_value}) }

    end

    context 'when array with simple values passes' do
      
      let(:hashable) { {some_key: [1, 2, 3]} }

      it { is_expected.to eq({'someKey' => [1, 2, 3]}) }

    end

    context 'when array with at least one complex value passes' do
      
      let(:el) { double(:el) }
      let(:hashable) { {some_key: [el]} }

      before { expect(el).to receive(:to_hash).and_return(el) }

      it { is_expected.to eq({'someKey' => [el]}) }

    end

  end

end