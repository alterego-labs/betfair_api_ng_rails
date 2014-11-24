module BetfairApiNgRails
  module Api
    class RequestMethod
      include Api::Constants

      attr_reader :name

      def initialize(name)
        @name = name
      end

      def allowed?
        allow_data.any?
      end

      def type
        return :no_type unless allowed?
        allow_data.keys.first
      end

      def api_url
        return :no_api_url unless allowed?
        API_URL[type]
      end

      private

      def allow_data
        @_allow_data ||= ALLOWED_RESOURCES.keep_if do |k, v|
          v.include? name
        end
      end
    end
  end
end
