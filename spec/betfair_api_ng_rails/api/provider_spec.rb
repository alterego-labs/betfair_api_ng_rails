require 'spec_helper'

describe BetfairApiNgRails::Api::Provider do
  let(:ssoid) { double(:ssoid) }
  let(:application_key) { '2ef8783ofno34fn' }

  subject { described_class.new(ssoid, application_key) }

  its(:ssoid) { is_expected.to eq ssoid }

  describe "#fetch" do
    let(:method) { double(:method, allowed?: method_allowed, name: 'someMethod') }

    context 'when method isn\'t allowed' do
      let(:method_allowed) { false }

      it "raises error" do
        expect{ subject.fetch(method: method) }.to raise_error
      end
    end

    context 'when requested method is allowed' do
      let(:method_allowed) { true }

      it "calls run_request" do
        expect(subject).to receive(:run_request).with(for_method: method, params: {})
        subject.fetch method: method
      end
    end
  end

  describe "private method" do
    describe "#run_request" do
      let(:http_requester) { double(:http_requester) }
      let(:method) { double(:method, api_url: 'api_url') }

      before { expect(subject).to receive(:http_requester).at_least(:once).and_return(http_requester) }

      it "runs http requster" do
        expect(http_requester).to receive(:set_api_req_body).with(method, {})
        expect(http_requester).to receive(:do_request)
        subject.send :run_request, for_method: method, params: {}
      end
    end

    describe "#http_requester" do
      it "initalizes provider http request" do
        expect(BetfairApiNgRails::Api::Http::Factory).to receive(:provider_requester).with 'api_url', ssoid
        subject.send :http_requester, 'api_url'
      end
    end
  end
end
