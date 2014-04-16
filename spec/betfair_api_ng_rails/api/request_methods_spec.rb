require 'spec_helper'

module TestModule
  extend BetfairApiNgRails::Api::RequestMethods
end

describe BetfairApiNgRails::Api::RequestMethods do
  
  describe "#list_event_types" do
    
    it "calls run_request with proper params" do
      expect(TestModule).to receive(:run_request).with(:list_event_types, {filter: :filter}, {locale: :en})
      TestModule.list_event_types filter: :filter
    end

  end

  describe "#place_orders" do
    
    it "calls run_request with proper params" do
      expect(TestModule).to receive(:run_request).with(:place_orders, {market_id: "", instructions: [], customer_ref: ""})
      TestModule.place_orders
    end

  end

  describe "private method" do
    
    describe "#build_request_type" do
      
      it "returns proper api method name" do
        expect(TestModule.send(:build_request_type, 'some_value')).to eq 'someValue'
      end

    end

    describe "#run_request" do
      
      let(:params) { {key1: 'value'} }
      let(:data) { {key2: 'value'} }
      let(:connection) { double(:connection) }

      before(:each) { BetfairApiNgRails.connection = connection }

      after(:each) { TestModule.send(:run_request, 'some_method', params, data) }

      it "calls request method with proper params" do
        expect(connection).to receive(:request).with('someMethod', params, data)
      end

    end

  end

end