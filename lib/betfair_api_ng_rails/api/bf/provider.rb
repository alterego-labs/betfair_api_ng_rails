require 'betfair_api_ng_rails/api/bf/concerns/errorable'

module BetfairApiNgRails
  module Api
    module BF
      class Provider < Api::BaseProvider
        include Api::BF::Concerns::Errorable
        include Api::BF::Constants

        attr_reader :session_manager, :http_requester

        def initialize
          @session_manager = Api::BF::SessionManager.new
          @provider_name = "BF"
          @http_requester = Api::BF::Http::Factory.provider_requester
        end

        def fetch(method: "", filter: {}, params: {})
          return [] unless BetfairApiNgRails::Api::BF::SessionManager.request_ssoid
          raise "Not allowed method #{method.to_s}" unless is_method_allowed?(method)
          do_request with_method: method, filter: filter, params: params
        end

      private

        def do_request(with_method: "", filter: {}, params: {})
          http_requester.set_api_req_body with_method, filter, params
          http_requester.do_request
        end

        def is_method_allowed?(method)
          ALLOWED_RESOURCES.include? method.to_s
        end

      end
    end
  end
end