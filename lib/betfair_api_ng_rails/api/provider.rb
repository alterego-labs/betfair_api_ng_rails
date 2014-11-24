require 'active_support/inflector'
require 'betfair_api_ng_rails/api/concerns/errorable'

module BetfairApiNgRails
  module Api
    class Provider
      include Api::Concerns::Errorable
      include Api::Constants

      attr_reader :ssoid

      def initialize(ssoid)
        @ssoid = ssoid
      end

      def fetch(method: "", params: {})
        raise "Not allowed method #{method.name}" unless method.allowed?
        run_request for_method: method, params: params
      end

      private

      def run_request(for_method: "", params: {})
        requester = http_requester(for_method.api_url)
        requester.set_api_req_body for_method, params
        requester.do_request
      end

      def http_requester(api_url)
        @_http_requester ||= Api::Http::Factory.provider_requester api_url, ssoid
      end
    end
  end
end
