module BetfairApiNgRails
  module Api
    module Parsers
      class ListMarketCatalogue < Api::Parsers::Base

      private

        def process_row(json_row)
          BetfairApiNgRails::MarketCatalogue.from_json json_row
        end

      end
    end
  end
end