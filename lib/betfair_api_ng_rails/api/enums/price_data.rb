module BetfairApiNgRails
  module Api
    module Enums
      class PriceData
        extend Api::Enums::Concerns::Enumable

        enumify "SP_AVAILABLE",
                "SP_TRADED",
                "EX_BEST_OFFERS",
                "EX_ALL_OFFERS",
                "EX_TRADED"

      end
    end
  end
end