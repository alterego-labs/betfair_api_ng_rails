module BetfairApiNgRails
  module Api
    module Enums
      class RollupModel
        extend Api::Enums::Concerns::Enumable

        enumify "STAKE",
                "PAYOUT",
                "MANAGED_LIABILITY",
                "NONE"

      end
    end
  end
end