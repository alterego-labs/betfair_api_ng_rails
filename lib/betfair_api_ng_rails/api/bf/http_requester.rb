require "net/https"
require "uri"
require 'json'
require './lib/api/bf/http_responser'
require 'pry-nav'

module Api
  module BF
    class HttpRequester

      attr_reader :http, :request, :uri

      def initialize(url, use_ssl = true)
        @uri = URI.parse url
        @http = Net::HTTP.new uri.host, uri.port
        http.use_ssl = use_ssl
        @request = Net::HTTP::Post.new uri.request_uri
      end

      def do_request
        Api::BF::HttpResponser.new http.request(request)
      end

      def set_crt_file(path)
        http.cert = OpenSSL::X509::Certificate.new(read_file(path))
      end

      def set_key_file(path)
        http.key = OpenSSL::PKey::RSA.new(read_file(path))
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
        request["X-Application"] = app_key
        request["X-Authentication"] = session_key if session_key
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

      def set_api_req_body(method, filter = {})
        set_request_body "{\"jsonrpc\": \"2.0\", \"method\": \"SportsAPING/v1.0/#{method}\", \"params\": {\"filter\": #{filter.to_json}}}"
      end

    private

      def read_file(path)
        File.read path
      end

    end
  end
end