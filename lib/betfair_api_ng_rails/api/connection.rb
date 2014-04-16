module BetfairApiNgRails
  module Api
    class Connection
      
      attr_reader :config, :ssoid

      def inilialize(config)
        @config = config
        request_ssoid
      end

      def request(method, params = {}, data = {})
        # provider.fetch method, pa
      end

    protected

      def provider
        @_provider ||= BetfairApiNgRails::Api::Provider.new ssoid
      end

      def request_ssoid
        BetfairApiNgRails::Api::SessionManager.expire_ssoid
        @ssoid = BetfairApiNgRails::Api::SessionManager.ssoid
      end

    end
  end
end