module BetfairApiNgRails
  module Api
    module Enums
      #
      # The turn in play persistence state of the order at bet placement time.
      #
      # Includes:
      # LAPSE           - Lapse the order when the market is turned in-play
      # PERSIST         - Persist the order to in-play. The bet will be place automatically into the in-play market at the start of the event.
      # MARKET_ON_CLOSE - Put the order into the auction (SP) at turn-in-play
      class PersistenceType
        extend Api::Enums::Concerns::Enumable

        enumify "LAPSE",
                "PERSIST",
                "MARKET_ON_CLOSE"

      end
    end
  end
end
