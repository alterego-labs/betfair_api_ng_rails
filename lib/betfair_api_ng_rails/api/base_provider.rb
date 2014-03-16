require 'active_support/inflector'

module BetfairApiNgRails
  module Api
    class BaseProvider

      attr_reader :provider_name

      def fetch(data: "", parameters: {}, sport: "")
        raise "Must be reimplemented!"
      end

    private

      def build_function(method)
        "list#{method.to_s.camelize}"
      end

      def build_parser(data)
        "BetfairApiNgRails::Api::#{provider_name}::Parser".constantize.new data.to_s.singularize
      end

    end
  end
end