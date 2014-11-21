module BetfairApiNgRails
  module Api
    module Data
      class MarketOnCloseOrder < Api::Data::Base
        include Api::Data::Concerns::Hashable

        MARKET_ON_CLOSE_ORDER_ATTRS = [
          :liability
        ]

        attributes MARKET_ON_CLOSE_ORDER_ATTRS

        def self.to_hash_attrs
          MARKET_ON_CLOSE_ORDER_ATTRS
        end
      end
    end
  end
end

