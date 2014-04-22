require 'spec_helper'

class TestJsonable
  include BetfairApiNgRails::Api::Data::Concerns::Jsonable

  def initialize(args = {})
    args.each { |attribute, value| self.send("#{attribute}=", value) }
  end

  attr_accessor :some_attr
end

describe BetfairApiNgRails::Api::Data::Concerns::Jsonable do

  describe "class method" do

    subject { TestJsonable }

    describe ".from_json" do
      
      context 'when not defined class attributes' do
        
        its(:from_json) { is_expected.to eq nil }

      end

      context 'when class attributes defined' do
        
        before { allow(subject).to receive(:class_attrs) }

        let(:attributes) { {some_attr: :val1} }

        it "returns new instance with fetched attributes" do
          expect(subject).to receive(:set_attributes).and_return attributes
          expect(subject).to receive(:new).with(attributes)
          subject.from_json
        end

      end

    end

    describe ".json_key" do
      
      it 'changes passed value to camelize lowercase string' do
        expect(subject.send(:json_key, :some_value)).to eq "someValue"
      end

    end

    describe ".set_attributes" do
      
      let(:data) { double(:data) }

      before { allow(subject).to receive(:class_attrs).and_return({some_attr: {type: String}}) }

      it "returns hash attributes" do
        expect(subject).to receive(:get_attr_value).with data, :some_attr, {type: String}
        subject.send :set_attributes, data
      end

    end

    describe ".get_attr_value" do
      
      subject { TestJsonable.send(:get_attr_value, attribs, :some_attr, {type: type, array: is_array}) }

      context 'when fetching data for single valued attr' do
        
        let(:attribs)  { {'someAttr' => :value} }
        let(:is_array) { false }

        context 'and its type is String ' do
          
          let(:type) { String }

          it { is_expected.to eq :value }

        end

        context 'and its type is custom' do

          let(:type) { TestJsonable }

          it "calls from_json on proper class" do
            expect(type).to receive(:from_json).and_return :some_object
            expect(subject).to eq :some_object
          end
          
        end

      end

      context 'when fetching data for array attr' do

        let(:attribs)  { {'someAttr' => [:value]} }
        let(:is_array) { false }
        
        context 'and its type is custom' do
          
          let(:type) { TestJsonable }

          it "calls from_json on proper class" do
            expect(type).to receive(:from_json).and_return [:some_object]
            expect(subject).to include(:some_object)
          end

        end

      end

    end

    describe ".prepare_value" do
      
      let(:data) { double(:data) }

      subject { TestJsonable.send(:prepare_value, type, data) }

      context 'when called for String type' do
        
        let(:type) { String }

        it { is_expected.to eq data }

      end

      context 'when called for custom type' do
      
        let(:type) { TestJsonable }

        before { expect(TestJsonable).to receive(:from_json).and_return(:some_object) }

        it { is_expected.to eq (:some_object) }

      end

    end

  end

  describe "integration tests" do

    before do 
      allow(TestJsonable).to receive(:class_attrs).and_return({some_attr: {type: String, array: false}})
    end

    context 'success load object from hashable json' do
      
      subject { TestJsonable.from_json({'someAttr' => :value}) }

      its(:some_attr) { is_expected.to eq :value }

    end
    
  end

end