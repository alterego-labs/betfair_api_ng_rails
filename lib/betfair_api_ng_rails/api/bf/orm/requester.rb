require 'active_support/inflector'

module BetfairApiNgRails
  module Api
    module BF
      module ORM
        class Requester
          class << self

            def load(resource: "", filter: Api::BF::Data::MarketFilter.new, params: {})
              res = current_provider.fetch method: build_function(resource), filter: filter, params: set_locale(params)
              process_response resource, res
            end

          private

            def process_response(resource, res)
              r = parse_response(build_function(resource), res)
              format_response(resource, r)
            end

            def parse_response(function, res)
              build_parser(function, res).process
            end

            def format_response(resource, res)
              return res unless BetfairApiNgRails.config.formatter
              res.map { |obj| BetfairApiNgRails.config.formatter.format(record: obj, resource: resource) }
            end

            def set_locale(params)
              params.merge locale: BetfairApiNgRails.config.locale
            end

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