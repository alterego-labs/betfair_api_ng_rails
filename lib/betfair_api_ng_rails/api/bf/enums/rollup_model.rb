module BetfairApiNgRails
  module Api
    module BF
      module Enums
        class RollupModel
          extend Api::BF::Enums::Concerns::Enumable

          enumify "STAKE",
                  "PAYOUT",
                  "MANAGED_LIABILITY",
                  "NONE"

        end
      end
    end
  end
end