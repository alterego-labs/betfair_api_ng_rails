module BetfairApiNgRails
  module Api
    module Enums
      class GroupBy
        extend Api::Enums::Concerns::Enumable

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