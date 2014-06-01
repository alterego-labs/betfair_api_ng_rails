require 'active_support/inflector'

module BetfairApiNgRails
  module Api
    module ConnectionExt
      module Caching
        include BetfairApiNgRails::Api::Constants

        def self.included(base)
          base.send :class_eval,  <<-CODE
            def request_with_caching(method, params = {})
              res = request_without_caching(method, params)
            end
            alias_method :request_without_caching, :request
            alias_method :request, :request_with_caching
          CODE
        end

      private

      end
    end
  end
end