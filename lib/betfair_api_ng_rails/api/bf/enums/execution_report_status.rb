module BetfairApiNgRails
  module Api
    module BF
      module Enums
        class ExecutionReportStatus
          extend Api::BF::Enums::Concerns::Enumable

          enumify "SUCCESS",
                  "FAILURE",
                  "PROCESSED_WITH_ERRORS",
                  "TIMEOUT"

        end
      end
    end
  end
end