module BetfairApiNgRails
  module Api
    class Connection
      
      attr_reader :config, :ssoid

      def inilialize(config)
        @config = config
        @ssoid = BetfairApiNgRails::Api::SessionManager.ssoid
      end

    end
  end
end