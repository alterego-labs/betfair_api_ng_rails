module BetfairApiNgRails
  module Api
    module Soccer
      class Requester < BetfairApiNgRails::Api::BaseRequester

        def initialize(provider: "")
          @sport = :soccer
          super provider
        end

        def load(resource: "", parameters: {})
          @data = resource
          make_fetch parameters: parameters
        end

      private

        def make_fetch(parameters: {})
          current_provider.fetch data: data, parameters: parameters, sport: sport
        end

      end
    end
  end
end