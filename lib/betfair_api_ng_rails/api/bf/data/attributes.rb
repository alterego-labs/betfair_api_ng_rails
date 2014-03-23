module BetfairApiNgRails
  module Api
    module BF
      module Data
        module Attributes

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

          COMPETITION_ATTRS = [
            :id,
            :name
          ]

          EVENT_TYPE_ATTRS = [
            :id,
            :name
          ]

          EVENT_ATTRS = [
            :id,
            :name,
            :timezone,
            :country_code,
            :venue,
            :open_date
          ]

          TIME_RANGE_ATTRS = [
            :from,
            :to
          ]

        end
      end
    end
  end
end