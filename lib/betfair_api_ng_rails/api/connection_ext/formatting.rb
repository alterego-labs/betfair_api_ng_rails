require 'active_support/inflector'
require 'pry-nav'

module BetfairApiNgRails
  module Api
    module ConnectionExt
      module Formatting
        include BetfairApiNgRails::Api::Constants

        def self.included(base)
          base.send :class_eval,  <<-CODE
            def request_with_formatting(method, params = {})
              res = request_without_formatting(method, params)
              need_formatting_for?(method) ? formatting(method, res) : res
            end
            alias_method :request_without_formatting, :request
            alias_method :request, :request_with_formatting
          CODE
        end

      private

        def formatting(method, result)
          BetfairApiNgRails.config.formatter.process result, as: method
        end

        def need_formatting_for?(method)
          ALLOWED_FORMATTING.include?(method) && BetfairApiNgRails.config.formatter
        end

      end
    end
  end
end