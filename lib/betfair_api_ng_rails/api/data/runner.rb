module BetfairApiNgRails
  module Api
    module Data
      class Runner < Api::Data::Base

        RUNNER_ATTRS = [
          :selection_id,
          :handicap,
          :status,
          :adjustment_factor,
          :last_price_traded,
          :total_matched,
          :removal_date,
          {sp:      { type: BetfairApiNgRails::StartingPrices     }},
          {ex:      { type: BetfairApiNgRails::ExchangePrices     }},
          {orders:  { type: BetfairApiNgRails::Order, array: true }},
          {matches: { type: BetfairApiNgRails::Match, array: true }}
        ]

        attributes RUNNER_ATTRS
      end
    end
  end
end