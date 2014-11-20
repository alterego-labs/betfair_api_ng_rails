shared_examples 'request method' do
  let(:ssoid)              { 'vnboeirubvyebvuekrybobvuiberlvbre' }
  let(:connection)         { BetfairApiNgRails::Api::Connection.new }
  let(:http_response)      { double(:http_response, code: '200', body: result_hash) }
  let(:result)             { BetfairApiNgRails::Api::Http::Responser.new(http_response) }
  let(:filter)             { BetfairApiNgRails::MarketFilter.new }
  let(:api_http_requester) { double(:api_http_requester, do_request: result, set_api_req_body: true) }

  before(:each) do
    expect(BetfairApiNgRails::Api::SessionManager).to receive(:new_ssoid).and_return ssoid
    expect(BetfairApiNgRails::Api::Http::Factory).to receive(:provider_requester).with(ssoid).and_return api_http_requester
    BetfairApiNgRails.connection = connection
  end

  subject { TestModule.send(method_name, parameters) }
end
