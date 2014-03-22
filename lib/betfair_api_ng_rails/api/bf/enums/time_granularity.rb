module BetfairApiNgRails
  module Api
    module BF
      module Enums
        class TimeGranularity
          extend Api::BF::Enums::Concerns::Enumable

          enumify "DAYS",
                  "HOURS",
                  "MINUTES"

        end
      end
    end
  end
end