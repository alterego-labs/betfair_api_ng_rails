require 'active_support/inflector'
require "betfair_api_ng_rails/errors"

module BetfairApiNgRails
  module Api
    module ConnectionExt
      module SsoidRefreshing
        include BetfairApiNgRails::Api::Constants

        def self.included(base)
          base.send :class_eval,  <<-CODE
            def request_with_ssoid_refreshing(method, params = {})
              res = nil
              begin
                res = request_without_ssoid_refreshing(method, params)
              rescue BetfairApiNgRails::APINGException => e
                raise e unless is_ssoid_problem?(e)
                try_request method, params
              end
              res
            end
            alias_method :request_without_ssoid_refreshing, :request
            alias_method :request, :request_with_ssoid_refreshing
          CODE
        end

      private

        def is_ssoid_problem?(e)
          e.info[:info]["code"].to_i == -32099
        end

        def try_request(method, params)
          expire_provider
          request_without_ssoid_refreshing(method, params)
        end

      end
    end
  end
end