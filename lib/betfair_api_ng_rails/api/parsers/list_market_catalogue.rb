module BetfairApiNgRails
  module Api
    module Parsers
      class ListMarketCatalogue < Api::Parsers::ListBase
        private

        def data_class
          BetfairApiNgRails::MarketCatalogue
        end
      end
    end
  end
end
