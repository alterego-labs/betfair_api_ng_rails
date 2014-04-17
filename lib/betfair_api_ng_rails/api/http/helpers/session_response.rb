module BetfairApiNgRails
  module Api
    module Http
      module Helpers
        module SessionResponse
          include BetfairApiNgRails::Api::Constants
          
          def self.included(base)
            base.send :class_eval,  <<-CODE
              def has_error_with_session_response?
                has_error_without_session_response? || session_res_error?
              end
              alias_method :has_error_without_session_response?, :has_error?
              alias_method :has_error?, :has_error_with_session_response?
            CODE
          end

          def session_token
            result['sessionToken']
          end

        protected

          def session_res_error?
            set_error_info(:SESSION, result['loginStatus']) if check_login_status
          end

          def check_login_status
            result.fetch('loginStatus', SUCCESS_LOGIN) != SUCCESS_LOGIN
          end

        end
      end
    end
  end
end