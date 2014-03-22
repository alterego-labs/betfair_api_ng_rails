module BetfairApiNgRails
  module Api
    module BF
      module Enums
        class InstructionReportErrorCode
          extend Api::BF::Enums::Concerns::Enumable

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
end