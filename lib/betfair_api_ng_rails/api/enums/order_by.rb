module BetfairApiNgRails
  module Api
    module Enums
      class OrderBy
        extend Api::Enums::Concerns::Enumable

        enumify "BY_BET",
                "BY_MARKET",
                "BY_MATCH_TIME"

      end
    end
  end
end