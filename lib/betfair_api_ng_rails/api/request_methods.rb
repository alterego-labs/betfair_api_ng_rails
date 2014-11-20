require 'active_support/inflector'
require 'betfair_api_ng_rails/api/constants'

module BetfairApiNgRails
  module Api
    module RequestMethods
      include Api::Constants

      SIMPLE_LISTING_FILTERED.each do |method|
        eval <<-CODE
          def #{method.underscore}(filter: Api::Data::MarketFilter.new, locale: BetfairApiNgRails.config.locale)
            run_request __method__, { filter: filter }, { locale: locale }
          end
        CODE
      end

      def list_market_catalogue(filter: MarketFilter.new, market_projection: [], sort: "", max_results: '1', locale: BetfairApiNgRails.config.locale)
        run_request __method__, { filter: filter, market_projection: market_projection, sort: sort, max_results: max_results }, { locale: locale }
      end

      def list_market_book(market_ids: [], price_projection: BetfairApiNgRails::PriceProjection.new, order_projection: '', match_projection: '', currency_code: 'USD', locale: BetfairApiNgRails.config.locale)
        run_request __method__, { market_ids: market_ids, price_projection: price_projection, order_projection: order_projection, match_projection: match_projection }, { currency_code: currency_code, locale: locale }
      end

      def place_orders(market_id: "", instructions: [], customer_ref: "")
        run_request __method__, { market_id: market_id, instructions: instructions, customer_ref: customer_ref }
      end

      private

      def run_request(method, params, data = {})
        BetfairApiNgRails.connection.request build_request_type(method), params.merge(data)
      end

      def build_request_type(name)
        name.to_s.camelize(:lower)
      end
    end
  end
end
