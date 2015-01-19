require 'spec_helper'

describe BetfairApiNgRails::Api::Hashalator do
  let(:hashable) { { some_key: :some_value } }

  subject { described_class.new(hashable, for_param) }

  let(:for_param) { false }

  its(:hashable) { is_expected.to eq hashable }

  describe "#to_hash" do
    context 'when value isn\'t blank or nil' do
      it "iterates though elements and process they" do
        expect(subject).to receive(:hash_key).at_least(:once)
        expect(subject).to receive(:hash_value).at_least(:once).and_return double
        subject.to_hash
      end

    end

    context 'when else' do
      it "does include it result hash" do
        expect(subject).to receive(:hash_key).exactly(0).times
        expect(subject).to receive(:hash_value).at_least(:once)
        subject.to_hash
      end
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
      context 'when not for param' do
        it "returns key for api request hash" do
          expect(subject.send(:hash_key, :some_key)).to eq 'someKey'
        end
      end

      context 'when for param' do
        let(:for_param) { true }

        it "returns key for api request hash" do
          expect(subject.send(:hash_key, :some_key)).to eq :some_key
        end
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
    subject { described_class.new(hashable, for_param).to_hash }

    let(:for_param) { false }

    context 'when only simple values passed' do
      let(:hashable) { { some_key: :some_value } }

      context 'when not for param' do
        it { is_expected.to eq({'someKey' => :some_value}) }
      end

      context 'when for param' do
        let(:for_param) { true }

        it { is_expected.to eq({:some_key => :some_value}) }
      end
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

    context 'when one of values is blank' do
      let(:hashable) { {some_key: ""} }

      it { is_expected.to eq({}) }
    end

    context 'when one of values is nil' do
      let(:hashable) { {some_key: nil} }

      it { is_expected.to eq({}) }
    end
  end
end
