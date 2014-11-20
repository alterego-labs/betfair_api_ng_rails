module BetfairApiNgRails
  module Api
    module Enums
      #
      # Indicates whether the command succeeded or failed
      #
      # Includes:
      # SUCCESS
      # FAILURE
      # TIMEOUT
      class InstructionReportStatus
        extend Api::Enums::Concerns::Enumable

        enumify "SUCCESS",
                "FAILURE",
                "TIMEOUT"

      end
    end
  end
end
