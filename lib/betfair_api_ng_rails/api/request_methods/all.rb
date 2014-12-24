require 'active_support/inflector'
require 'betfair_api_ng_rails/api/constants'
require 'betfair_api_ng_rails/api/request_methods/betting'
require 'betfair_api_ng_rails/api/request_methods/account'

module BetfairApiNgRails
  module Api
    module RequestMethods
      module All
        include Api::Constants
        include Api::RequestMethods::Betting
        include Api::RequestMethods::Account

        private

        def run_request(method, params, account_name = '')
          BetfairApiNgRails::Api::Connection.new(account_name).request build_request_type(method), params
        end

        def build_request_type(name)
          name.to_s.camelize(:lower)
        end
      end
    end
  end
end
