module BetfairApiNgRails
  module Api
    module Http
      class Factory
        class << self
          include Api::Constants

          def provider_requester(api_url, ssoid = nil, app_key)
            create_http_requester(api_url).tap do |req|
              req.set_request_headers API_REQUEST_HEADERS
              req.set_auth_headers app_key, ssoid
            end
          end

          def session_requester(login_url, account)
            create_http_requester(login_url, false).tap do |req|
              req.set_ssl_files account.crt_filepath, account.key_filepath
              req.set_request_headers SESSION_REQUEST_HEADERS
              req.set_auth_headers account.app_key
              req.set_form_data "username" => account.username, "password" => account.password
            end
          end

          # TODO: Looks like this method does not used anywhere.
          # So this means that keep alive feature does not implemented.
          def keep_alive_requester(ssoid)
            create_http_requester(KEEP_ALIVE_URL, false).tap do |req|
              req.set_accept_header 'application/json'
              req.set_auth_headers Api::Config.application_key, ssoid
            end
          end

          private

          def create_http_requester(url = '', provider = true)
            if !Api::Config.proxy_enable
              Api::Http::Requester.new url
            else
              Api::Http::ProxyRequester.new url, provider
            end
          end
        end
      end
    end
  end
end
