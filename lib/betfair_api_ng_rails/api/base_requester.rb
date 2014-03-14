require 'active_support/inflector'

module BetfairApiNgRails
  module Api
    class BaseRequester

      attr_reader :provider_name, :sport, :data

      def initialize(provider)
        @provider_name = provider
      end

      def load(parameters: {})
        raise "Must be reimplemented!"
      end

    private

      def current_provider
        @_current_provider ||= "BetfairApiNgRails::Api::#{provider_name.to_s.upcase}::Provider".constantize.new
      end

    end
  end
end