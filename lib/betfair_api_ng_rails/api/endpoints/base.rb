module BetfairApiNgRails
  module Api
    module Endpoints
      #
      # Template class for defining endpoints.
      # Api endpoint provides URL building methods.
      # In derived classes (endpoints) you must to reimplement next protected methods:
      # - `#api_domain`
      # - `#login_domain`
      #
      class Base
        #
        # Provides api url for specified api type
        #
        # Parameters:
        # api_type - one of the :betting or :account
        #
        def api_url(api_type)
          "https://#{api_domain}/exchange/#{api_type}/json-rpc/v1"
        end

        def login_url
          "https://#{login_domain}/api/certlogin"
        end

        def keep_alive_url
          "https://#{login_domain}/api/keepAlive"
        end

        protected

        def api_domain
          raise NotImplementedError
        end

        def login_domain
          raise NotImplementedError
        end
      end
    end
  end
end
