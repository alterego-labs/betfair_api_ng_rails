module BetfairApiNgRails
  module Api
    module Parsers
      class ListMarketTypes < Api::Parsers::Base

      private

        def process_row(json_row)
          Api::Data::MarketTypeResult.from_json json_row
        end

      end
    end
  end
end