module BetfairApiNgRails
  module Api
    module BF
      module Http
        class Factory
          class << self
            include Api::BF::Constants

            def provider_requester(with_method: "", params: {})
              create_http_requester(Api::BF::Config.api_url).tap do |req|
                req.set_request_headers API_REQUEST_HEADERS
                req.set_auth_headers Api::BF::Config.application_key, session_manager.ssoid
                req.set_api_req_body with_method, params
              end
            end

            def session_requester
              create_http_requester(Api::BF::Config.login_url).tap do |req|
                req.set_ssl_files Api::BF::Config.ssl_crt_filepath, Api::BF::Config.ssl_key_filepath
                req.set_request_headers SESSION_REQUEST_HEADERS
                req.set_auth_headers Api::BF::Config.application_key
                req.set_form_data "username" => Api::BF::Config.username, "password" => Api::BF::Config.password
              end
            end

          private

            def create_http_requester(url: "")
              Api::BF::Http::Requester.new url
            end

          end
        end
      end
    end
  end
end