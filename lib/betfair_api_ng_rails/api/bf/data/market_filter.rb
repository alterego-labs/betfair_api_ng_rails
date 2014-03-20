module BetfairApiNgRails
  module Api
    module BF
      module Data
        class MarketFilter
          include BetfairApiNgRails::Api::BF::Data::Attributes
          include BetfairApiNgRails::Api::BF::Data::Concerns::Hashable

          attr_accessor MARKET_FILTER_ATTRS

          def to_hash_attrs
            MARKET_FILTER_ATTRS
          end

        end
      end
    end
  end
end