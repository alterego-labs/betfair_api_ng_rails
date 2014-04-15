module BetfairApiNgRails
  module Api
    class Connection
      
      attr_reader :config

      def inilialize(config)
        @config = config
      end

    end
  end
end