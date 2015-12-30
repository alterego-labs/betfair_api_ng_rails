require 'spec_helper'

describe BetfairApiNgRails::Api::Formatters::JsTreeFormatter do
  
  subject { described_class.new }

  describe "#process" do
    
    let(:record) { double(:record) }

    it "formats each resource record" do
      expect(subject).to receive(:format_record).with(record, :some_request)
      subject.process([record], as: 'listSomeRequest')
    end

  end

  describe "private method" do
    
    describe "#resource_from_method" do
      
      it "returns proper resource name" do
        expect(subject.send(:resource_from_method, 'listEventTypes')).to eq :event_types
      end

    end

    describe "#format_record" do
      
      context 'when passed nil record' do
        
        it "returns empty hash" do
          expect(subject.send(:format_record, nil, 'resource')).to eq({})
        end

      end

      context 'when passed valid params for formatting' do
        
        let(:resource) { double(:resource, id: 1, name: 'name', to_hash: true) }
        let(:record) { double(:record, some_resource: resource) }

        subject { described_class.new.send(:format_record, record, :some_resources) }

        its([:id]) { is_expected.to eq(1) }
        its([:text]) { is_expected.to eq('name') }

        context 'and resource allow children' do
          
          before { stub_const("BetfairApiNgRails::Api::Formatters::JsTreeFormatter::ALLOW_CHILDREN", [:some_resources]) }

          its([:children]) { is_expected.to eq(true) }

        end

        context 'and resource not allow children' do
          
          before { stub_const("BetfairApiNgRails::Api::Formatters::JsTreeFormatter::ALLOW_CHILDREN", []) }

          its([:children]) { is_expected.to eq(false) }

        end

      end

    end

  end

end