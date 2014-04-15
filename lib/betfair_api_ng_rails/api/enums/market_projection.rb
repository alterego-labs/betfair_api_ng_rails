module BetfairApiNgRails
  module Api
    module Enums
      class MarketProjection
        extend Api::Enums::Concerns::Enumable

        enumify "COMPETITION",
                "EVENT",
                "EVENT_TYPE",
                "MARKET_START_TIME",
                "MARKET_DESCRIPTION",
                "RUNNER_DESCRIPTION",
                "RUNNER_METADATA"

      end
    end
  end
end