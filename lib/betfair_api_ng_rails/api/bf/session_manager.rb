require "net/https"
require "uri"
require 'json'
require './lib/api/bf/config'
require './lib/api/bf/constants'
require './lib/api/bf/http_requester'
require './lib/api/bf/http_responser'
require './lib/api/bf/concerns/errorable'

module Api
  module BF
    class SessionManager
      include Api::BF::Concerns::Errorable
      include Api::BF::Constants

      def initialize
        setup_http_requester
      end

      def ssoid
        @ssoid ||= fetch_ssoid
      end

      def request_ssoid
        ssoid
        !has_errors?
      end

      def expire_ssoid
        @ssoid = nil
      end

    private

      def fetch_ssoid
        process_response get_login_response
      end

      def process_response(response)
        response['sessionToken']
      end

      def get_login_response
        @http_responser = @http_requester.do_request
        @http_responser.result
      end

      def setup_http_requester
        @http_requester = Api::BF::HttpRequester.new(Api::BF::Config.login_url).tap do |req|
          req.set_ssl_files Api::BF::Config.ssl_crt_filepath, Api::BF::Config.ssl_key_filepath
          req.set_request_headers SESSION_REQUEST_HEADERS
          req.set_auth_headers Api::BF::Config.application_key
          req.set_form_data "username" => Api::BF::Config.username, "password" => Api::BF::Config.password
        end
      end

    end
  end
end