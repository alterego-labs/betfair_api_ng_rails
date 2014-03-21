require 'json'

module BetfairApiNgRails
  module Api
    module BF
      module Http
        class Responser
          include Api::BF::Constants

          attr_reader :response, :error_info

          def initialize(response)
            @response = response
          end

          def result
            JSON.parse response.body
          end

          def has_error?
            http_error? || api_req_error? || session_req_error?
          end

        private

          def http_error?
            set_error_info(:HTTP, response.code) if check_response_code
          end

          def session_req_error?
            set_error_info(:SESSION, result['loginStatus']) if check_login_status
          end

          def api_req_error?
            set_error_info(:API, result['error']) if check_error_key
          end

          def check_response_code
            response.code != '200'
          end

          def check_login_status
            result.fetch('loginStatus', SUCCESS_LOGIN) != SUCCESS_LOGIN
          end

          def check_error_key
            result.has_key?('error')
          end

          def set_error_info(type, info)
            @error_info = { type: type, info: info }
          end

        end
      end
    end
  end
end