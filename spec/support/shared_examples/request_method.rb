shared_examples 'request method' do
  let(:ssoid)              { 'vnboeirubvyebvuekrybobvuiberlvbre' }
  let(:http_response)      { double(:http_response, code: '200', body: result_hash) }
  let(:result)             { BetfairApiNgRails::Api::Http::Responser.new(http_response) }
  let(:filter)             { BetfairApiNgRails::MarketFilter.new }
  let(:api_http_requester) { double(:api_http_requester, do_request: result, set_api_req_body: true, result: '') }

  before(:each) do
    allow(api_http_requester).to receive(:do_request).and_return result
    expect_any_instance_of(BetfairApiNgRails::Api::SessionManager).to receive(:get_ssoid).and_return ssoid
    expect(BetfairApiNgRails::Api::Http::Factory).to receive(:provider_requester).and_return api_http_requester
  end

  subject { TestModule.send(method_name, parameters) }
end
