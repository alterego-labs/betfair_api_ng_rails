module BetfairApiNgRails
  module Api
    module Enums
      class TimeGranularity
        extend Api::Enums::Concerns::Enumable

        enumify "DAYS",
                "HOURS",
                "MINUTES"

      end
    end
  end
end