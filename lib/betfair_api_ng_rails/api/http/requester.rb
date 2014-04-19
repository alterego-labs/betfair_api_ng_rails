require "net/https"
require "uri"
require 'json'
require 'betfair_api_ng_rails/api/helper'

module BetfairApiNgRails
  module Api
    module Http
      class Requester
        include BetfairApiNgRails::Api::Helper

        attr_reader :http, :request, :uri

        def initialize(url, use_ssl = true)
          @uri = URI.parse url
          @http = Net::HTTP.new uri.host, uri.port
          http.use_ssl = use_ssl
          @request = Net::HTTP::Post.new uri.request_uri
        end

        def do_request
          Api::Http::Responser.new http.request(request)
        end

        def set_crt_file(path)
          http.cert = read_certificate_file(path)
        end

        def set_key_file(path)
          http.key = read_rsa_file(path)
        end

        def set_verify_mode(value)
          http.verify_mode = value
        end

        def set_ssl_files(crt_path, key_path, verify = OpenSSL::SSL::VERIFY_PEER)
          set_crt_file crt_path
          set_key_file key_path
          set_verify_mode verify
        end

        def set_auth_headers(app_key, session_key = nil)
          set_header "X-Application", app_key
          set_header "X-Authentication", session_key if session_key
        end

        def set_accept_header(value)
          set_header 'Accept', value
        end

        def set_request_headers(headers)
          headers.each { |name, value| request[name] = value }
        end

        def set_form_data(values)
          request.set_form_data values
        end

        def set_request_body(body)
          request.body = body
        end

        def set_api_req_body(method, params = {})
          set_request_body prepare_api_req_json(method, params)
        end

        def set_header(name, value)
          request[name] = value
        end

      end
    end
  end
end