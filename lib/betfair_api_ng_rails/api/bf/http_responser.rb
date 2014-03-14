require './lib/api/bf/constants'
require 'json'

module Api
  module BF
    class HttpResponser
      include Api::BF::Constants

      attr_reader :response, :error_info

      def initialize(response)
        @response = response
      end

      def result
        JSON.parse response.body
      end

      def has_error?
        http_error? || api_req_error? || session_req_error?
      end

    private

      def http_error?
        (response.code != '200').tap { |val| set_error_info(:HTTP, response.code) if val }
      end

      def session_req_error?
        (result.fetch('loginStatus', SUCCESS_LOGIN) != SUCCESS_LOGIN).tap { |val| set_error_info(:SESSION, result['loginStatus']) if val }
      end

      def api_req_error?
        (result.has_key?('error')).tap { |val| set_error_info(:API, result['error']) if val }
      end

      def set_error_info(type, info)
        @error_info = { type: type, info: info }
      end

    end
  end
end