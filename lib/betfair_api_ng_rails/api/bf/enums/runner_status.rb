module BetfairApiNgRails
  module Api
    module BF
      module Enums
        class RunnerStatus
          extend Api::BF::Enums::Concerns::Enumable

          enumify "ACTIVE",
                  "WINNER",
                  "LOSER",
                  "REMOVED_VACANT",
                  "REMOVED",
                  "HIDDEN"

        end
      end
    end
  end
end