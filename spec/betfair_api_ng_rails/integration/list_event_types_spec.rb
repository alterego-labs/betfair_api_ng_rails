require 'spec_helper'

module TestModule
  extend BetfairApiNgRails::Api::RequestMethods
end

describe "listEventTypes request method" do
  
  let(:ssoid)              { 'vnboeirubvyebvuekrybobvuiberlvbre' }
  let(:connection)         { BetfairApiNgRails::Api::Connection.new }
  let(:api_http_requester) { double(:api_http_requester) }
  let(:result)             { double(:result) }
  let(:filter)             { BetfairApiNgRails::MarketFilter.new }
  let(:method_name)        { "listEventTypes" }

  before(:each) do
    expect(BetfairApiNgRails::Api::SessionManager).to receive(:new_ssoid).and_return ssoid
    expect(BetfairApiNgRails::Api::Http::Factory).to receive(:provider_requester).with(ssoid).and_return api_http_requester
    expect(api_http_requester).to receive(:set_api_req_body)
    expect(api_http_requester).to receive(:do_request).and_return result
    BetfairApiNgRails.connection = connection
  end

  it "should return result of http request" do
    expect(connection).to receive(:request).with(method_name, {filter: filter, locale: :en}).and_call_original
    expect_any_instance_of(BetfairApiNgRails::Api::Provider).to receive(:fetch).with(method: method_name, params: {'filter' => {}, 'locale' => :en}).and_call_original
    expect(TestModule.list_event_types(filter: filter)).to eq result
  end

end