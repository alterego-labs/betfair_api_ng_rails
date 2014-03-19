module BetfairApiNgRails
  module Api
    module BF
      module Data
        class MarketFilter

          attr_accessor :text_query,
                        :exchange_ids,
                        :event_type_ids,
                        :evnt_ids,
                        :competition_ids,
                        :venues,
                        :bspOnly,
                        :turn_in_play_enabled,
                        :in_play_only,
                        :market_betting_types,
                        :market_countries,
                        :market_type_codes,
                        :market_start_time,
                        :with_orders

        end
      end
    end
  end
end