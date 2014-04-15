module BetfairApiNgRails
  module Api
    module Http
      class Factory
        class << self
          include Api::Constants

          def provider_requester(with_method: "", params: {})
            create_http_requester(Api::Config.api_url).tap do |req|
              req.set_request_headers API_REQUEST_HEADERS
              req.set_auth_headers Api::Config.application_key, BetfairApiNgRails::Api::SessionManager.ssoid
              req.set_api_req_body with_method, params
            end
          end

          def session_requester
            create_http_requester(Api::Config.login_url).tap do |req|
              req.set_ssl_files Api::Config.ssl_crt_filepath, Api::Config.ssl_key_filepath
              req.set_request_headers SESSION_REQUEST_HEADERS
              req.set_auth_headers Api::Config.application_key
              req.set_form_data "username" => Api::Config.username, "password" => Api::Config.password
            end
          end

          def keep_alive_requester(ssoid)
            create_http_requester(Api::Config.keep_alive_url).tap do |req|
              req.set_accept_header 'application/json'
              req.set_auth_headers Api::Config.application_key, ssoid
            end
          end

        private

          def create_http_requester(url = "")
            Api::Http::Requester.new url
          end

        end
      end
    end
  end
end