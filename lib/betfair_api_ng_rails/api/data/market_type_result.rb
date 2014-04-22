module BetfairApiNgRails
  module Api
    module Data
      class MarketTypeResult < Api::Data::Base

        MARKET_TYPE_RESULT_ATTRS = [
          :market_count,
          :market_type
        ]

        attributes MARKET_TYPE_RESULT_ATTRS

      end
    end
  end
end