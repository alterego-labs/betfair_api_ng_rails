module BetfairApiNgRails
  module Api
    module Data
      class ExBestOffersOverrides < Api::Data::Base

        EX_BEST_OFFERS_OVERRIDES_ATTRS = [
          :best_prices_depth,
          :rollup_model,
          :rollup_limit,
          :rollup_liability_threshold,
          :rollup_liability_factor
        ]

        attributes EX_BEST_OFFERS_OVERRIDES_ATTRS

        def self.to_hash_attrs
          EX_BEST_OFFERS_OVERRIDES_ATTRS
        end

      end
    end
  end
end