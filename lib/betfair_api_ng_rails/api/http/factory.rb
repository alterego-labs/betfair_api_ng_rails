module BetfairApiNgRails
  module Api
    module Http
      class Factory
        class << self
          include Api::Constants

          def provider_requester(ssoid = nil)
            create_http_requester(Api::Config.api_url).tap do |req|
              req.set_request_headers API_REQUEST_HEADERS
              req.set_auth_headers Api::Config.application_key, ssoid
            end
          end

          def session_requester
            create_http_requester(LOGIN_URL, false).tap do |req|
              req.set_ssl_files Api::Config.ssl_crt_filepath, Api::Config.ssl_key_filepath
              req.set_request_headers SESSION_REQUEST_HEADERS
              req.set_auth_headers Api::Config.application_key
              req.set_form_data "username" => Api::Config.username, "password" => Api::Config.password
            end
          end

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
