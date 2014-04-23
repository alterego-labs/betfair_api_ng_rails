module BetfairApiNgRails
  module Api
    module Data
      class MarketFilter < Api::Data::Base
        include Api::Data::Concerns::Hashable

        MARKET_FILTER_ATTRS = [
          :text_query,
          :exchange_ids,
          :event_type_ids,
          :event_ids,
          :competition_ids,
          :venues,
          :bsp_only,
          :turn_in_play_enabled,
          :in_play_only,
          :market_betting_types,
          :market_countries,
          :market_type_codes,
          :market_start_time,
          :with_orders
        ]

        attributes MARKET_FILTER_ATTRS

        def self.to_hash_attrs
          MARKET_FILTER_ATTRS
        end

      end
    end
  end
end