module BetfairApiNgRails
  module Api
    module Data
      #
      # Summary of a cleared order.
      #
      class StatementLegacyData < Api::Data::Base
        include Api::Data::Concerns::Hashable

        STATEMENT_LEGACY_DATA_ATTRS = [
          :avg_price,
          :bet_size,
          :bet_type,
          :bet_category_type,
          :comission_rate,
          :event_id,
          :event_type_id,
          :full_market_name,
          :gross_bet_amount,
          :market_name,
          :market_type,
          :placed_date,
          :selection_id,
          :selection_name,
          :start_date,
          :transaction_type,
          :transaction_id,
          :win_lose
        ]

        attributes STATEMENT_LEGACY_DATA_ATTRS
      end
    end
  end
end

