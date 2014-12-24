module BetfairApiNgRails
  module Api
    module Http
      module Helpers
        module KeepAliveResponse
          include BetfairApiNgRails::Api::Constants

          def self.included(base)
            base.send :class_eval,  <<-CODE
              def has_error_with_keep_alive_response?
                has_error_without_keep_alive_response? || keep_alive_res_error?
              end
              alias_method :has_error_without_keep_alive_response?, :has_error?
              alias_method :has_error?, :has_error_with_keep_alive_response?
            CODE
          end

          protected

          def keep_alive_res_error?
            set_error_info(:KEEP_ALIVE, result['status']) if check_keep_alive_status
          end

          def check_keep_alive_status
            result.fetch('status', SUCCESS_LOGIN) != SUCCESS_LOGIN
          end
        end
      end
    end
  end
end
