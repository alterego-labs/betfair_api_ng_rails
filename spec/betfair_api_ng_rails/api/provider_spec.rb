require 'spec_helper'

describe BetfairApiNgRails::Api::Provider do
  
  let(:ssoid) { double(:ssoid) }

  subject { described_class.new(ssoid) }

  its(:ssoid) { is_expected.to eq ssoid }

  describe "#fetch" do
    
    before { expect(subject).to receive(:is_method_allowed?).with(:some_method).and_return(method_allowed) }

    context 'when method isn\'t allowed' do
      
      let(:method_allowed) { false }

      it "raises error" do
        expect{ subject.fetch(method: :some_method) }.to raise_error
      end

    end

    context 'when requested method is allowed' do
      
      let(:method_allowed) { true }

      it "calls run_request" do
        expect(subject).to receive(:run_request).with(for_method: :some_method, params: {})
        subject.fetch method: :some_method
      end

    end

  end

  describe "private method" do
    
    describe "#run_request" do
      
      let(:http_requester) { double(:http_requester) }

      before { expect(subject).to receive(:http_requester).at_least(:once).and_return(http_requester) }

      it "runs http requster" do
        expect(http_requester).to receive(:set_api_req_body).with(:some_method, {})
        expect(http_requester).to receive(:do_request)
        subject.send :run_request, for_method: :some_method, params: {}
      end

    end

    describe "#is_method_allowed?" do
      
      before { stub_const("BetfairApiNgRails::Api::Constants::ALLOWED_RESOURCES", allowed_methods) }

      context 'when requested method marked as allowed' do
        
        let(:allowed_methods) { ['some_method'] }

        it "returns true" do
          expect(subject.send(:is_method_allowed?, :some_method)).to eq true
        end

      end

      context 'when requested method isn\'t allowed' do
        
        let(:allowed_methods) { ['some_another_method'] }

        it "returns false" do
          expect(subject.send(:is_method_allowed?, :some_method)).to eq false
        end

      end

    end

    describe "#http_requester" do
      
      it "initalizes provider http request" do
        expect(BetfairApiNgRails::Api::Http::Factory).to receive(:provider_requester).with ssoid
        subject.send :http_requester
      end

    end

  end

end