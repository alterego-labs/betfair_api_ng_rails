require 'active_support/core_ext/module/delegation'
require "betfair_api_ng_rails/errors"

module BetfairApiNgRails
  module Api
    class Connection
      attr_reader :account_name, :endpoint, :session_manager

      delegate :app_key, :username, to: :account

      def initialize(account_name)
        BetfairApiNgRails.log.write("==> Initializing new connection #{self}")
        @account_name = account_name
        @endpoint = BetfairApiNgRails.config.endpoint
        @session_manager = Api::SessionManager.new(endpoint)
      end

      def request(method, params = {})
        provider.fetch method: Api::RequestMethod.new(method, endpoint), params: hashing(params)
      end

      include Api::ConnectionExt::Caching
      include Api::ConnectionExt::Logging
      include Api::ConnectionExt::ErrorHandling
      include Api::ConnectionExt::SsoidRefreshing
      include Api::ConnectionExt::Parsing
      include Api::ConnectionExt::Formatting

      protected

      def expire_provider
        session_manager.expire_ssoid account
      end

      def provider
        Api::Provider.new request_ssoid, app_key
      end

      def request_ssoid
        session_manager.get_ssoid account
      end

      def hashing(params)
        Api::Hashalator.new(params).to_hash
      end

      def account
        acc = BetfairApiNgRails.account_manager.get account_name
        raise BetfairApiNgRails::NoAccountProvided unless acc
        BetfairApiNgRails.log.write("==> Using account #{acc.username}")
        acc
      end
    end
  end
end
