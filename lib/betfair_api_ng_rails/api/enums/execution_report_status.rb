module BetfairApiNgRails
  module Api
    module Enums
      #
      # Status of execution report
      #
      # Includes:
      # SUCCESS               - Order processed successfully
      # FAILURE               - Order failed.
      # PROCESSED_WITH_ERRORS - The order itself has been accepted, but at least one (possibly all)
      #                         actions have generated errors. This error only occurs for replaceOrders,
      #                         cancelOrders and updateOrders operations. The placeOrders operation will not return
      #                         PROCESSED_WITH_ERRORS status as it is an atomic operation.
      # TIMEOUT               - Order timed out.
      class ExecutionReportStatus
        extend Api::Enums::Concerns::Enumable

        enumify "SUCCESS",
                "FAILURE",
                "PROCESSED_WITH_ERRORS",
                "TIMEOUT"

      end
    end
  end
end
