module BetfairApiNgRails
  module Api
    module Data
      class ExchangePrices < Api::Data::Base

        EXCHANGE_PRICES_ATTRS = [
          {available_to_back:    { type: BetfairApiNgRails::PriceSize, array: true }},
          {available_to_lay:     { type: BetfairApiNgRails::PriceSize, array: true }},
          {traded_volume:        { type: BetfairApiNgRails::PriceSize, array: true }}
        ]

        attributes EXCHANGE_PRICES_ATTRS
      end
    end
  end
end