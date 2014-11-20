module BetfairApiNgRails
  module Api
    module Enums
      #
      # The type of bet (e.g standard limited-liability Exchange bet (LIMIT), a standard BSP bet (MARKET_ON_CLOSE), or
      # a minimum-accepted-price BSP bet (LIMIT_ON_CLOSE)). If the bet has a OrderType of MARKET_ON_CLOSE and
      # a persistenceType of MARKET_ON_CLOSE then it is a bet which has transitioned from LIMIT to MARKET_ON_CLOSE.
      # Only available at BET groupBy level
      #
      # Includes:
      # LIMIT           - A normal exchange limit order for immediate execution
      # LIMIT_ON_CLOSE  - Limit order for the auction (SP)
      # MARKET_ON_CLOSE - Market order for the auction (SP)
      class OrderType
        extend Api::Enums::Concerns::Enumable

        enumify "LIMIT",
                "LIMIT_ON_CLOSE",
                "MARKET_ON_CLOSE"
      end
    end
  end
end
