require "betfair_api_ng_rails/errors"

module BetfairApiNgRails
  module Api
    class Connection

      def request(method, params = {})
        provider.fetch method: method, params: hashing(params)
      end

      include Api::ConnectionExt::Logging
      include Api::ConnectionExt::ErrorHandling
      include Api::ConnectionExt::SsoidRefreshing
      include Api::ConnectionExt::Parsing
      include Api::ConnectionExt::Formatting

      def expire_provider
        @_provider = nil
      end

    protected

      def provider
        @_provider ||= BetfairApiNgRails::Api::Provider.new request_ssoid
      end

      def request_ssoid
        BetfairApiNgRails::Api::SessionManager.new_ssoid
      end

      def hashing(params)
        BetfairApiNgRails::Api::Hashalator.new(params).to_hash
      end

    end
  end
end