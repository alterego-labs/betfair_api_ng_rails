module BetfairApiNgRails
  module Api
    module Data
      class PriceProjection < Api::Data::Base

        PRICE_PROJECTION_ATTRS = [
          :price_data,
          {ex_best_offers_overrides: { type: BetfairApiNgRails::ExBestOffersOverrides }},
          :virtualise,
          :rollover_stakes
        ]

        attributes PRICE_PROJECTION_ATTRS

        def self.to_hash_attrs
          PRICE_PROJECTION_ATTRS
        end

      end
    end
  end
end