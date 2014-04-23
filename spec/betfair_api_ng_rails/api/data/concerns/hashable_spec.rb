require 'spec_helper'

class TestClass
  include BetfairApiNgRails::Api::Data::Concerns::Hashable

  attr_accessor :name

  def initialize()
    @name = 'Walli'
  end

  def self.to_hash_attrs
    [:name]
  end

end

describe BetfairApiNgRails::Api::Data::Concerns::Hashable do
  
  subject { TestClass.new }

  describe "#to_hash" do
    
    let(:attributes) { double(:attributes) }
    let(:hashalator) { double(:hashalator) }

    it "returns Hashalator's to_hash result" do
      expect(subject).to receive(:attributes_hash).and_return attributes
      expect(BetfairApiNgRails::Api::Hashalator).to receive(:new).with(attributes).and_return hashalator
      expect(hashalator).to receive(:to_hash)
      subject.to_hash
    end

  end

  describe "private method" do
    
    describe "#attributes_hash" do
      
      context "returns hash represantation of attributes and its values" do

        its(:attributes_hash) { is_expected.to eq({:name => 'Walli'}) }

      end

    end

    describe "#get_attr_value" do
      
      it "returns attribute value by its name" do
        expect(subject.send(:get_attr_value, :name)).to eq 'Walli'
      end

    end

    describe "#get_attr_key" do
      
      subject { TestClass.new.send :get_attr_key, attrib }

      context 'when passed Hash' do
      
        let(:attrib) { {some_attr: { type: String }} }

        context 'returns first key' do
          
          it { is_expected.to eq :some_attr }

        end

      end 

      context 'when passed single value' do
        
        let(:attrib) { :some_attr }

        context 'returns it' do
          
          it { is_expected.to eq :some_attr }

        end

      end

    end

  end

  describe "integration tests" do
    
    context "returns hash represention of TestClass instance" do

      its(:to_hash) { is_expected.to eq({'name' => 'Walli'}) }

    end

    context 'dont include nil attributes in resulting hash' do
      
      before(:each) do
        subject.class.send :instance_eval, <<-CODE
          attr_accessor :second_name
          def self.to_hash_attrs; [:name, :second_name]; end
        CODE
      end

      its(:to_hash) { is_expected.to eq({'name' => 'Walli'}) }

    end

    context 'when exists attr with additional options' do
      
      before(:each) do
        subject.class.send :instance_eval, <<-CODE
          attr_accessor :second_name
          def self.to_hash_attrs; [:name, {second_name: {type: String, array: false}}]; end
        CODE
        subject.second_name = "Black"
      end

      its(:to_hash) { is_expected.to eq({'name' => 'Walli', 'secondName' => 'Black'}) }

    end

  end

end