module BetfairApiNgRails
  module Api
    module BF
      module Enums
        class MarketSort
          extend Api::BF::Enums::Concerns::Enumable

          enumify "MINIMUM_TRADED",
                  "MAXIMUM_TRADED",
                  "MINIMUM_AVAILABLE",
                  "MAXIMUM_AVAILABLE",
                  "FIRST_TO_START",
                  "LAST_TO_START"

        end
      end
    end
  end
end