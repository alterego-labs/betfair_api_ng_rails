require './lib/api/base_provider'
require './lib/api/bf/config'
require './lib/api/bf/session_manager'
require './lib/api/bf/constants'
require './lib/api/bf/http_requester'
require './lib/api/bf/concerns/errorable'
require 'pry-nav'

Dir['./lib/api/bf/parsers/soccer/**/*.rb'].each {|f| require f}

module Api
  module BF
    class Provider < Api::BaseProvider
      include Api::BF::Concerns::Errorable
      include Api::BF::Constants

      attr_reader :session_manager

      def initialize
        @session_manager = Api::BF::SessionManager.new
      end

      def fetch(data: "", parameters: {}, sport: "")
        return [] unless session_manager.request_ssoid
        setup_http_requester with_method: data
        do_request data, parameters, sport
      end

    private

      def do_request(data, parameters, sport)
        @http_responser = @http_requester.do_request
        process_response @http_responser.result, build_parser(data, sport)
      end

      def process_response(response, parser)
        parser.parse response: response
      end

      def setup_http_requester(with_method: "")
        @http_requester = Api::BF::HttpRequester.new(Api::BF::Config.api_url).tap do |req|
          req.set_request_headers API_REQUEST_HEADERS
          req.set_auth_headers Api::BF::Config.application_key, session_manager.ssoid
          req.set_api_req_body build_function(with_method)
        end
      end

    end
  end
end