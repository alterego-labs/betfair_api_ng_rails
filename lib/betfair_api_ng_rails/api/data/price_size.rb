module BetfairApiNgRails
  module Api
    module Data
      class PriceSize < Api::Data::Base

        PRICE_SIZE_ATTRS = [
          :price,
          :size
        ]

        attributes PRICE_SIZE_ATTRS
      end
    end
  end
end