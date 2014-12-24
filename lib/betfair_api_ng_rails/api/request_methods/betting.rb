module BetfairApiNgRails
  module Api
    module RequestMethods
      module Betting
        include Api::Constants

        SIMPLE_LISTING_FILTERED.each do |method|
          eval <<-CODE
          def #{method.underscore}(filter: BetfairApiNgRails::MarketFilter.new, locale: BetfairApiNgRails.config.locale)
            run_request __method__, { filter: filter, locale: locale }
          end
          CODE
        end

        def list_market_catalogue(filter: BetfairApiNgRails::MarketFilter.new, market_projection: [], sort: "", max_results: '1', locale: BetfairApiNgRails.config.locale)
          run_request __method__, { filter: filter, market_projection: market_projection, sort: sort, max_results: max_results, locale: locale }
        end

        def list_market_book(market_ids: [], price_projection: BetfairApiNgRails::PriceProjection.new, order_projection: '', match_projection: '', currency_code: 'USD', locale: BetfairApiNgRails.config.locale)
          run_request __method__, { market_ids: market_ids, price_projection: price_projection, order_projection: order_projection, match_projection: match_projection, currency_code: currency_code, locale: locale }
        end

        def place_orders(market_id: "", instructions: [], customer_ref: "", account_name: '')
          run_request __method__, { market_id: market_id, instructions: instructions, customer_ref: customer_ref }, account_name
        end
      end
    end
  end
end

