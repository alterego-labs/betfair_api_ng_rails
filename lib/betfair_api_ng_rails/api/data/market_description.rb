module BetfairApiNgRails
  module Api
    module Data
      class MarketDescription < Api::Data::Base

        MARKET_DESCRIPTION_ATTRS = [
          :persistence_enabled,
          :bsp_market,
          :market_time,
          :suspend_time,
          :settle_time,
          :betting_type,
          :turn_in_play_enabled,
          :market_type,
          :regulator,
          :market_base_rate,
          :discount_allowed,
          :wallet,
          :rules,
          :rules_has_date,
          :clarifications
        ]

        attributes MARKET_DESCRIPTION_ATTRS

      end
    end
  end
end