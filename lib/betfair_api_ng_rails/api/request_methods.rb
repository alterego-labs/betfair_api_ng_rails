require 'active_support/inflector'

module BetfairApiNgRails
  module Api
    module RequestMethods
      
      def list_event_types(filter: Api::Data::MarketFilter.new, locale: :en)
        run_request __method__, { filter: filter }, { locale: locale }
      end

      def place_orders(market_id: "", instructions: [], customer_ref: "")
        run_request __method__, { market_id: market_id, instructions: instructions, customer_ref: customer_ref }
      end

    private

      def run_request(method, params, data)
        BetfairApiNgRails.connection.request build_request_type(method), params, data
      end

      def build_request_type(name)
        name.to_s.camelize(:lower)
      end

    end
  end
end