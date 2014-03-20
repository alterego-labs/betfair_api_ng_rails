require 'active_support/inflector'

module BetfairApiNgRails
  module Api
    module BF
      module ORM
        class Requester
          class << self

            def load(resource: "", filter: Api::BF::Data::MarketFilter.new, params: {})
              res = current_provider.fetch method: build_function(resource), filter: filter, params: params
              build_parser(build_function(resource), res).process
            end

          private

            def build_function(method)
              "list#{method.to_s.camelize}"
            end

            def current_provider
              @_current_provider ||= BetfairApiNgRails::Api::BF::Provider.new
            end

            def build_parser(method, responser)
              "BetfairApiNgRails::Api::BF::ORM::Parsers::#{method.to_s.camelize}".constantize.new responser
            end

          end
        end
      end
    end
  end
end