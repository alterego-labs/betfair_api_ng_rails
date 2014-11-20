module BetfairApiNgRails
  module Api
    module Data
      class PlaceInstruction < Api::Data::Base
        include Api::Data::Concerns::Hashable

        PLACE_INSTRUCTION_ATTRS = [
          :order_type,
          :selection_id,
          :handicap,
          :side,
          { limit_order: { type: BetfairApiNgRails::LimitOrder } },
          { limit_on_close_order: { type: BetfairApiNgRails::LimitOnCloseOrder } },
          { market_on_close_order: { type: BetfairApiNgRails::MarketOnCloseOrder } }
        ]

        attributes PLACE_INSTRUCTION_ATTRS

        def self.to_hash_attrs
          PLACE_INSTRUCTION_ATTRS
        end
      end
    end
  end
end
