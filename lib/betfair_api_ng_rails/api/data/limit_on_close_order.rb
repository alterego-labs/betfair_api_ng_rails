module BetfairApiNgRails
  module Api
    module Data
      class LimitOnCloseOrder < Api::Data::Base
        include Api::Data::Concerns::Hashable

        LIMIT_ON_CLOSE_ORDER_ATTRS = [
          :liability,
          :price
        ]

        attributes LIMIT_ON_CLOSE_ORDER_ATTRS

        def self.to_hash_attrs
          LIMIT_ON_CLOSE_ORDER_ATTRS
        end
      end
    end
  end
end


