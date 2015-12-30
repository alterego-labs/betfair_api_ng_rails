module BetfairApiNgRails
  module Api
    module Endpoints
      class Spanish < Base
        protected

        def api_domain
          "api.betfair.com"
        end

        def login_domain
          "identitysso.betfair.es"
        end
      end
    end
  end
end
