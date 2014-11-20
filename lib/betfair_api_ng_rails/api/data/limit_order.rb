module BetfairApiNgRails
  module Api
    module Data
      class LimitOrder < Api::Data::Base
        include Api::Data::Concerns::Hashable

        LIMIT_ORDER_ATTRS = [
          :size,
          :price,
          :persistence_type
        ]

        attributes LIMIT_ORDER_ATTRS

        def self.to_hash_attrs
          LIMIT_ORDER_ATTRS
        end
      end
    end
  end
end


