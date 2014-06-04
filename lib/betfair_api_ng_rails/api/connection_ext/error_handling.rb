require 'active_support/inflector'
require "betfair_api_ng_rails/errors"

module BetfairApiNgRails
  module Api
    module ConnectionExt
      module ErrorHandling
        include BetfairApiNgRails::Api::Constants

        def self.included(base)
          base.send :class_eval,  <<-CODE
            def request_with_error_handling(method, params = {})
              res = request_without_error_handling(method, params)
              raise_exception(res.try(:error_info) || default_error_info) if res.nil? || res.has_error?
              res
            end
            alias_method :request_without_error_handling, :request
            alias_method :request, :request_with_error_handling
          CODE
        end

      private

        def raise_exception(error)
          raise BetfairApiNgRails::APINGException.new(error), "Error in #{error[:type]} section"
        end

        def default_error_info
          {type: :SESSION, info: { 'code' => -32099 }}
        end

      end
    end
  end
end