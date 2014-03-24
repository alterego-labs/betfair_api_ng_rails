module BetfairApiNgRails
  module Api
    module BF
      module Data
        class MarketFilter < Api::BF::Data::Base
          include Api::BF::Data::Attributes
          include Api::BF::Data::Concerns::Hashable

          attr_accessor *MARKET_FILTER_ATTRS

          def self.to_hash_attrs
            MARKET_FILTER_ATTRS
          end

        end
      end
    end
  end
end