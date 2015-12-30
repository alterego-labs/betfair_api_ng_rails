module BetfairApiNgRails
  module Api
    class RequestMethod
      include Api::Constants

      attr_reader :name, :endpoint

      def initialize(name, endpoint = BetfairApiNgRails.config.endpoint)
        @name = name
        @endpoint = endpoint
        BetfairApiNgRails.log.write("==> Creating request method for #{name}")
      end

      def allowed?
        allow_data.any?
      end

      def type
        fetch_type
      end

      def api_url
        endpoint.api_url(type)
      end

      def json_method
        JSON_METHOD[type]
      end

      private

      def fetch_type
        allow_data.keys.first.to_s.to_sym
      end

      def allow_data
        @_allow_data ||= ALLOWED_RESOURCES.select do |k, v|
          v.include? name
        end
      end
    end
  end
end
