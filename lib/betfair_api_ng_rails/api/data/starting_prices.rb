module BetfairApiNgRails
  module Api
    module Data
      class StartingPrices < Api::Data::Base

        STARTING_PRICES_ATTRS = [
          :near_price,
          :far_price,
          {back_stake_taken:    { type: BetfairApiNgRails::PriceSize, array: true }},
          {lay_liability_taken: { type: BetfairApiNgRails::PriceSize, array: true }},
          :actual_s_p
        ]

        attributes STARTING_PRICES_ATTRS
      end
    end
  end
end