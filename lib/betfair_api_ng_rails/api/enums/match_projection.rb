module BetfairApiNgRails
  module Api
    module Enums
      class MatchProjection
        extend Api::Enums::Concerns::Enumable

        enumify "NO_ROLLUP",
                "ROLLED_UP_BY_PRICE",
                "ROLLED_UP_BY_AVG_PRICE"

      end
    end
  end
end