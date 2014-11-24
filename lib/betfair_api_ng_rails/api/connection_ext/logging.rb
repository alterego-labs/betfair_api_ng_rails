require 'active_support/inflector'

module BetfairApiNgRails
  module Api
    module ConnectionExt
      module Logging
        include BetfairApiNgRails::Api::Constants

        def self.included(base)
          base.send :class_eval,  <<-CODE
            def request_with_logging(method, params = {})
              write_income_request method, params
              res = request_without_logging(method, params)
              write_result(res)
              res
            end
            alias_method :request_without_logging, :request
            alias_method :request, :request_with_logging
          CODE
        end

        private

        def write_income_request(method, params)
          BetfairApiNgRails.log.write("--->Income request for #{method} with parameters #{hashing(params)}")
        end

        def write_result(res)
          BetfairApiNgRails.log.write("    Result of request: #{res.result}")
        end
      end
    end
  end
end
