require 'active_support/inflector'

module BetfairApiNgRails
  module Api
    class BaseProvider

      attr_reader :provider_name

      def fetch(method: "", filter: {}, params: {})
        raise "Must be reimplemented!"
      end

    end
  end
end