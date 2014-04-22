require 'spec_helper'

class TestJsonable
  include BetfairApiNgRails::Api::Data::Concerns::Jsonable
end

describe BetfairApiNgRails::Api::Data::Concerns::Jsonable do

  describe "class method" do

    subject { TestJsonable }

    describe ".to_json" do
      
      context 'when not defined class attributes' do
        
        its(:to_json) { is_expected.to eq nil }

      end

      context 'when class attributes defined' do
        
        before { allow(subject).to receive(:class_attrs) }

        let(:attributes) { {some_attr: :val1} }

        it "returns new instance with fetched attributes" do
          expect(subject).to receive(:set_attributes).and_return attributes
          expect(subject).to receive(:new).with(attributes)
          subject.to_json
        end

      end

    end

    describe ".json_key" do
      
      it 'changes passed value to camelize lowercase string' do
        expect(subject.send(:json_key, :some_value)).to eq "someValue"
      end

    end

    describe ".set_attributes" do
      
    end

  end

end