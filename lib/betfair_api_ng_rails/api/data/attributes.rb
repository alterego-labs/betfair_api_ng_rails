module BetfairApiNgRails
  module Api
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

        MARKET_CATALOGUE_ATTRS = [
          :market_id,
          :market_name,
          :market_start_time,
          :description,
          :total_matched,
          :runners,
          :event_type,
          :competition,
          :event
        ]

        RUNNER_CATALOG_ATTRS = [
          :selection_id,
          :runner_name,
          :handicap,
          :sort_priority,
          :metadata
        ]

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

      end
    end
  end
end