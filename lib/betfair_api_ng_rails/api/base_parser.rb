require 'json'

module BetfairApiNgRails
  module Api
    class BaseParser

      def parse(response: {})
        raise 'Must be reimplemented!'
      end

    private

      def jsonify(response)
        JSON.parse response
      rescue
        {}
      end

      def process_record(h)
        h
      end

    end
  end
end