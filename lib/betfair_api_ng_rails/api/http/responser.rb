require 'json'
require 'betfair_api_ng_rails/api/http/helpers/information_response'
require 'betfair_api_ng_rails/api/http/helpers/keep_alive_response'
require 'betfair_api_ng_rails/api/http/helpers/session_response'

module BetfairApiNgRails
  module Api
    module Http
      class Responser
        include Api::Constants

        attr_reader :response, :error_info

        def initialize(response)
          @response = response
        end

        def result
          JSON.parse response.body
        end

        def has_error?
          http_error?
        end

        include Api::Http::Helpers::InformationResponse
        include Api::Http::Helpers::KeepAliveResponse
        include Api::Http::Helpers::SessionResponse

      protected

        def http_error?
          set_error_info(:HTTP, response.code) if check_response_code
        end

        def check_response_code
          response.code != '200'
        end

        def set_error_info(type, info)
          @error_info = { type: type, info: info }
        end

      end
    end
  end
end