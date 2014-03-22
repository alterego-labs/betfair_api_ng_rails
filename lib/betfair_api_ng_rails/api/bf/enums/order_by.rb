module BetfairApiNgRails
  module Api
    module BF
      module Enums
        class OrderBy
          extend Api::BF::Enums::Concerns::Enumable

          enumify "BY_BET",
                  "BY_MARKET",
                  "BY_MATCH_TIME"

        end
      end
    end
  end
end