module BetfairApiNgRails
  module Api
    module Enums
      class InstructionReportStatus
        extend Api::Enums::Concerns::Enumable

        enumify "SUCCESS",
                "FAILURE",
                "TIMEOUT"

      end
    end
  end
end