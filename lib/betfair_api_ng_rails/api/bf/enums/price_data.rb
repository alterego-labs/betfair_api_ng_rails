module BetfairApiNgRails
  module Api
    module BF
      module Enums
        class PriceData
          extend Api::BF::Enums::Concerns::Enumable

          enumify "SP_AVAILABLE",
                  "SP_TRADED",
                  "EX_BEST_OFFERS",
                  "EX_ALL_OFFERS",
                  "EX_TRADED"

        end
      end
    end
  end
end