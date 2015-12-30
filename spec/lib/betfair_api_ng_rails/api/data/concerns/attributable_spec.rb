require 'spec_helper'

class TestClass
  include BetfairApiNgRails::Api::Data::Concerns::Attributable
end

describe BetfairApiNgRails::Api::Data::Concerns::Attributable do

  describe "class method" do
    
    subject { TestClass }

    describe ".attributes" do
      
      let(:attrib) { [:some_attr] }

      it "defines all needed attr accessors" do
        expect(TestClass).to receive(:define_class_attrs).with(attrib)
        expect(TestClass).to receive(:define_attr_accessors)
        TestClass.attributes attrib
      end

    end

    describe ".define_class_attrs" do
      
      before do
        expect(TestClass).to receive(:process_attributes).and_return [:some_attr]
        TestClass.send :define_class_attrs, [:some_attr]
      end

      its(:class_attrs) { is_expected.to include(:some_attr) }

    end

    describe ".fetch_attr_name" do
      
      subject { TestClass.send :fetch_attr_name, attrib }

      context 'when passed hash' do
        
        let(:attrib) { {some_attr: {type: String}} }

        context "returns first key name" do
          it { is_expected.to eq :some_attr }
        end

      end

      context 'when passed simple string' do
        
        let(:attrib) { :some_attr1 }

        context 'returns passed value' do
          it { is_expected.to eq :some_attr1 }
        end

      end

    end

    describe ".fetch_attr_options" do
      
      subject { TestClass.send :fetch_attr_options, attrib }

      context 'when passed hash' do
        
        let(:attrib) { {some_attr: {type: String}} }

        context "returns default options merged with setted one" do
          it { is_expected.to eq({type: String, array: false}) }
        end

      end

      context 'when passed simple string' do
        
        let(:attrib) { :some_attr1 }

        context 'returns default options' do
          it { is_expected.to eq({type: String, array: false}) }
        end

      end

    end

    describe ".define_attr_accessors" do

      before { expect(TestClass).to receive(:class_attrs).and_return({some_attr: {type: String, array: false}}) }

      it "defines attr accessors for instance" do
        expect(TestClass).to receive(:class_eval).with("attr_accessor :some_attr")
        TestClass.send :define_attr_accessors
      end
      
    end

    describe ".process_attributes" do
      
      subject { TestClass.send :process_attributes, attributes }

      context 'when simple value passed' do
        
        let(:attributes) { [:some_attr] }

        context "returns attributes with default settings" do
          
          it { is_expected.to eq({some_attr: BetfairApiNgRails::Api::Data::Concerns::Attributable::DEFAULT_OPTIONS}) }

        end

      end

      context 'when attribute with params passed' do
        
        let(:attributes) { [{some_attr: {type: Integer}}] }

        context "returns attributes with merged setting" do
          
          it { is_expected.to eq({some_attr: {type: Integer, array: false}}) }

        end

      end

    end

  end

  describe "integration tests" do
    
    let(:attrib) { [:some_attr, {some_attr1: {type: Integer}}] }

    before { TestClass.attributes attrib }

    context 'for instance' do

      subject { TestClass.new }

      its(:some_attr) { is_expected.to be_nil }
      its(:some_attr1) { is_expected.to be_nil }

    end

    context 'for class' do
      
      subject { TestClass }

      its('class_attrs.keys') { is_expected.to include(:some_attr) }

    end

  end

end
