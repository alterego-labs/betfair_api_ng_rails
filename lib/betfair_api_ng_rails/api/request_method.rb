module BetfairApiNgRails
  module Api
    class RequestMethod
      include Api::Constants

      attr_reader :name

      def initialize(name)
        @name = name
        BetfairApiNgRails.log.write("==> Creating request method for #{name}")
      end

      def allowed?
        allow_data.any?
      end

      def type
        return :no_type unless allowed?
        allow_data.keys.first.tap do |t|
          BetfairApiNgRails.log.write("==> Type of #{name} is #{t}")
        end
      end

      def api_url
        return :no_api_url unless allowed?
        API_URL[type].tap do |u|
          BetfairApiNgRails.log.write("==> Api url of #{name} is #{u}")
        end
      end

      def json_method
        return :no_method unless allowed?
        JSON_METHOD[type].tap do |j|
          BetfairApiNgRails.log.write("==> Json method of #{name} is #{j}")
        end
      end

      private

      def allow_data
        @_allow_data ||= ALLOWED_RESOURCES.select do |k, v|
          v.include? name
        end
      end
    end
  end
end
