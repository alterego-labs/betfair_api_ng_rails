module BetfairApiNgRails
  module Api
    module Endpoints
      class Australian < Base
        protected

        def api_domain
          "api-au.betfair.com"
        end

        def login_domain
          "identitysso.betfair.com"
        end
      end
    end
  end
end
