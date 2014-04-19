module BetfairApiNgRails
  module Api
    module Http
      module Helpers
        module InformationResponse
          
          def self.included(base)
            base.send :class_eval,  <<-CODE
              def has_error_with_info_response?
                has_error_without_info_response? || info_response_error?
              end
              alias_method :has_error_without_info_response?, :has_error?
              alias_method :has_error?, :has_error_with_info_response?
            CODE
          end

          def api_result
            result['result']
          end

        protected

          def info_response_error?
            set_error_info(:API, result['error']) if check_info_response_status
          end

          def check_info_response_status
            result.has_key?('error')
          end

        end
      end
    end
  end
end