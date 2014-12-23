require "net/https"
require "uri"
require 'json'
require 'betfair_api_ng_rails/api/helper'

module BetfairApiNgRails
  module Api
    module Http
      class ProxyRequester
        include BetfairApiNgRails::Api::Helper

        attr_reader :http, :request, :uri,
                    :app_key, :session_key, :username,
                    :password, :body, :is_provider

        def initialize(url, provider = true, use_ssl = true)
          @is_provider = provider
        end

        def do_request
          create_http
          prepare_form_data
          Api::Http::Responser.new http.request(request)
        end

        def set_auth_headers(app_key, session_key = nil)
          @app_key = app_key
          @session_key = session_key
        end

        def set_form_data(values)
          @username = values['username']
          @password = values['password']
        end

        def set_request_body(body)
          @body = body
        end

        def set_api_req_body(method, params = {})
          set_request_body prepare_api_req_json(method, params)
        end

        def set_crt_file(_path); end
        def set_key_file(_path); end
        def set_verify_mode(_value); end
        def set_ssl_files(_crt_path, _key_path, _verify = OpenSSL::SSL::VERIFY_PEER); end
        def set_accept_header(_value); end
        def set_request_headers(_headers); end
        def set_header(_name, _value); end

        private

        def create_http
          @uri = URI.parse prepare_url
          BetfairApiNgRails.log.write("==> Using url #{prepare_url}")
          @http = Net::HTTP.new uri.host, uri.port
          @request = Net::HTTP::Post.new uri.request_uri
        end

        def prepare_url
          is_provider ? prepare_api_url : prepare_auth_url
        end

        def prepare_auth_url
          "#{Api::Config.proxy_url}/auth/en/#{username}/#{password}/#{app_key}/#{Api::Config.go_localuser}/#{Api::Config.go_filename}"
        end

        def prepare_api_url
          "#{Api::Config.proxy_url}/api"
        end

        def prepare_form_data
          return unless is_provider
          BetfairApiNgRails.log.write("==> Setting request body #{body}")
          request.set_form_data({
            app_key: app_key,
            session_token: session_key,
            body: body
          })
        end
      end
    end
  end
end
