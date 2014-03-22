module BetfairApiNgRails
  module Api
    module BF
      module Enums
        class GroupBy
          extend Api::BF::Enums::Concerns::Enumable

          enumify "EVENT_TYPE",
                  "EVENT",
                  "MARKET",
                  "RUNNER",
                  "SIDE",
                  "BET"

        end
      end
    end
  end
end