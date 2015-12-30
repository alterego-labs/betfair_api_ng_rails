module BetfairApiNgRails
  module Api
    module Endpoints
      class Uk < Base
        protected

        def api_domain
          "api.betfair.com"
        end

        def login_domain
          "identitysso.betfair.com"
        end
      end
    end
  end
end
