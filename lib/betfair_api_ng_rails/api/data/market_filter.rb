module BetfairApiNgRails
  module Api
    module Data
      class MarketFilter < Api::Data::Base
        include Api::Data::Attributes
        include Api::Data::Concerns::Hashable

        attr_accessor *MARKET_FILTER_ATTRS

        def self.to_hash_attrs
          MARKET_FILTER_ATTRS
        end

      end
    end
  end
end