module BetfairApiNgRails
  module Api
    module Parsers
      class ListMarketBook < Api::Parsers::ListBase
        private

        def data_class
          BetfairApiNgRails::MarketBook
        end
      end
    end
  end
end
