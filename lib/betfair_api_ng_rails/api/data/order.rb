module BetfairApiNgRails
  module Api
    module Data
      class Order < Api::Data::Base

        ORDER_ATTRS = [
          :bet_id,
          :order_type,
          :status,
          :persistence_type,
          :side,
          :price,
          :size,
          :bsp_liability,
          :placed_date,
          :avg_price_matched,
          :size_matched,
          :size_remaining,
          :size_lapsed,
          :size_cancelled,
          :size_voided
        ]

        attributes ORDER_ATTRS
        
      end
    end
  end
end