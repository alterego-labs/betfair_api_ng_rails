module BetfairApiNgRails
  module Api
    module Enums
      #
      # Error code of execution report
      #
      # Includes:
      # ERROR_IN_MATCHER - The matcher is not healthy
      # PROCESSED_WITH_ERRORS - The order itself has been accepted, but at least one (possibly all) actions have generated errors
      # BET_ACTION_ERROR - There is an error with an action that has caused the entire order to be rejected
      # INVALID_ACCOUNT_STATE - Order rejected due to the account's status (suspended, inactive, dup cards)
      # INVALID_WALLET_STATUS - Order rejected due to the account's wallet's status
      # INSUFFICIENT_FUNDS - Account has exceeded its exposure limit or available to bet limit
      # LOSS_LIMIT_EXCEEDED - The account has exceed the self imposed loss limit
      # MARKET_SUSPENDED - Market is suspended
      # MARKET_NOT_OPEN_FOR_BETTING - Market is not open for betting. It is either not yet active, suspended or closed awaiting settlement.
      # DUPLICATE_TRANSACTION - duplicate customer referece data submitted
      # INVALID_ORDER - Order cannot be accepted by the matcher due to the combination of actions. For example, bets being edited are not on the same market, or order includes both edits and placement
      # INVALID_MARKET_ID - Market doesn't exist
      # PERMISSION_DENIED - Business rules do not allow order to be placed
      # DUPLICATE_BETIDS - duplicate bet ids found
      # NO_ACTION_REQUIRED - Order hasn't been passed to matcher as system detected there will be no state change
      # SERVICE_UNAVAILABLE - The requested service is unavailable
      # REJECTED_BY_REGULATOR - The regulator rejected the order. On the Italian Exchange this error will occur if more than 50 bets are sent in a single placeOrders request.
      class ExecutionReportErrorCode
        extend Api::Enums::Concerns::Enumable

        enumify "ERROR_IN_MATCHER",
                "PROCESSED_WITH_ERRORS",
                "BET_ACTION_ERROR",
                "INVALID_ACCOUNT_STATE",
                "INVALID_WALLET_STATUS",
                "INSUFFICIENT_FUNDS",
                "LOSS_LIMIT_EXCEEDED",
                "MARKET_SUSPENDED",
                "MARKET_NOT_OPEN_FOR_BETTING",
                "DUPLICATE_TRANSACTION",
                "INVALID_ORDER",
                "INVALID_MARKET_ID",
                "PERMISSION_DENIED",
                "DUPLICATE_BETIDS",
                "NO_ACTION_REQUIRED",
                "SERVICE_UNAVAILABLE",
                "REJECTED_BY_REGULATOR"

      end
    end
  end
end
