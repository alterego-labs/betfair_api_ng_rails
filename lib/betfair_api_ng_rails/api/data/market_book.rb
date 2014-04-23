module BetfairApiNgRails
  module Api
    module Data
      class MarketBook < Api::Data::Base

        MARKET_BOOK_ATTRS = [
          :market_id,
          :is_market_data_delayed,
          :status,
          :bet_delay,
          :bsp_reconciled,
          :complete,
          :inplay,
          :number_of_runners,
          :number_of_winners,
          :number_of_active_runners,
          :last_match_time,
          :total_matched,
          :total_available,
          :cross_matching,
          :runners_voidable,
          :version,
          {runners: { type: BetfairApiNgRails::Runner, array: true }}
        ]
        
        attributes MARKET_BOOK_ATTRS

      end
    end
  end
end