module BetfairApiNgRails
  module Api
    module Parsers
      class ListMarketBook < Api::Parsers::Base

      private

        def process_row(json_row)
          BetfairApiNgRails::MarketBook.from_json json_row
        end

      end
    end
  end
end