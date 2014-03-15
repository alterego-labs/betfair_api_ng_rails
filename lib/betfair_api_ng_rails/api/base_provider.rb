require 'active_support/inflector'

module BetfairApiNgRails
  module Api
    class BaseProvider

      def fetch(data: "", parameters: {}, sport: "")
        raise "Must be reimplemented!"
      end

    private

      def build_function(method)
        "list#{method.to_s.camelize}"
      end

      def build_parser(data, sport)
        "BetfairApiNgRails::Api::BF::Parsers::#{sport.to_s.camelize}::#{data.to_s.singularize.camelize}Parser".constantize.new
      end

    end
  end
end