module BetfairApiNgRails
  module Api
    module Enums
      #
      # Indicates cause of failure
      #
      # Includes:
      # INVALID_BET_SIZE - bet size is invalid for your currency or your regulator
      # INVALID_RUNNER - Runner does not exist, includes vacant traps in greyhound racing
      # BET_TAKEN_OR_LAPSED - Bet cannot be cancelled or modified as it has already been taken or has lapsed Includes attempts to cancel/modify market on close BSP bets and cancelling limit on close BSP bets
      # BET_IN_PROGRESS - No result was received from the matcher in a timeout configured for the system
      # RUNNER_REMOVED - Runner has been removed from the event
      # MARKET_NOT_OPEN_FOR_BETTING - Attempt to edit a bet on a market that has closed.
      # LOSS_LIMIT_EXCEEDED - The action has caused the account to exceed the self imposed loss limit
      # MARKET_NOT_OPEN_FOR_BSP_BETTING - Market now closed to bsp betting. Turned in-play or has been reconciled
      # INVALID_PRICE_EDIT - Attempt to edit down the price of a bsp limit on close lay bet, or edit up the price of a limit on close back bet
      # INVALID_ODDS - Odds not on price ladder - either edit or placement
      # INSUFFICIENT_FUNDS - Insufficient funds available to cover the bet action. Either the exposure limit or available to bet limit would be exceeded
      # INVALID_PERSISTENCE_TYPE - Invalid persistence type for this market, e.g. KEEP for a non bsp market
      # ERROR_IN_MATCHER - A problem with the matcher prevented this action completing successfully
      # INVALID_BACK_LAY_COMBINATION - The order contains a back and a lay for the same runner at overlapping prices. This would guarantee a self match. This also applies to BSP limit on close bets
      # ERROR_IN_ORDER - The action failed because the parent order failed
      # INVALID_BID_TYPE - Bid type is mandatory
      # INVALID_BET_ID - Bet for id supplied has not been found
      # CANCELLED_NOT_PLACED - Bet cancelled but replacement bet was not placed
      # RELATED_ACTION_FAILED - Action failed due to the failure of a action on which this action is dependent
      # NO_ACTION_REQUIRED - the action does not result in any state change. eg changing a persistence to it's current value
      class InstructionReportErrorCode
        extend Api::Enums::Concerns::Enumable

        enumify "INVALID_BET_SIZE",
                "INVALID_RUNNER",
                "BET_TAKEN_OR_LAPSED",
                "BET_IN_PROGRESS",
                "RUNNER_REMOVED",
                "MARKET_NOT_OPEN_FOR_BETTING",
                "LOSS_LIMIT_EXCEEDED",
                "MARKET_NOT_OPEN_FOR_BSP_BETTING",
                "INVALID_PRICE_EDIT",
                "INVALID_ODDS",
                "INSUFFICIENT_FUNDS",
                "INVALID_PERSISTENCE_TYPE",
                "ERROR_IN_MATCHER",
                "INVALID_BACK_LAY_COMBINATION",
                "ERROR_IN_ORDER",
                "INVALID_BID_TYPE",
                "INVALID_BET_ID",
                "CANCELLED_NOT_PLACED",
                "RELATED_ACTION_FAILED",
                "NO_ACTION_REQUIRED"

      end
    end
  end
end
