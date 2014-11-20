module BetfairApiNgRails
  module Api
    module Parsers
      class ListMarketTypes < Api::Parsers::ListBase
        private

        def data_class
          Api::Data::MarketTypeResult
        end
      end
    end
  end
end
