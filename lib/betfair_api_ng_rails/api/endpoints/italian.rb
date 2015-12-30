module BetfairApiNgRails
  module Api
    module Endpoints
      class Italian < Base
        protected

        def api_domain
          "api.betfair.com"
        end

        def login_domain
          "identitysso.betfair.it"
        end
      end
    end
  end
end
