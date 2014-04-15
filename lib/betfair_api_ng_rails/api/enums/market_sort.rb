module BetfairApiNgRails
  module Api
    module Enums
      class MarketSort
        extend Api::Enums::Concerns::Enumable

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