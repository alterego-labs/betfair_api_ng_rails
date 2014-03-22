module BetfairApiNgRails
  module Api
    module BF
      module Enums
        class MarketBettingType
          extend Api::BF::Enums::Concerns::Enumable

          enumify "ODDS",
                  "LINE",
                  "RANGE",
                  "ASIAN_HANDICAP_DOUBLE_LINE",
                  "ASIAN_HANDICAP_SINGLE_LINE",
                  "FIXED_ODDS"

        end
      end
    end
  end
end