module BetfairApiNgRails
  module Api
    module Enums
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