module BetfairApiNgRails
  module Api
    module Helper
      def read_certificate_file(path)
        OpenSSL::X509::Certificate.new read_file(path)
      end

      def read_rsa_file(path)
        OpenSSL::PKey::RSA.new read_file(path)
      end

      def read_file(path)
        File.read path
      rescue
        ""
      end

      def prepare_api_req_json(method, params)
        {
          "jsonrpc" => "2.0",
          "method" => "SportsAPING/v1.0/#{method}",
          "params" => params
        }.to_json
      end
    end
  end
end
