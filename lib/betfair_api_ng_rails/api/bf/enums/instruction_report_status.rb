module BetfairApiNgRails
  module Api
    module BF
      module Enums
        class InstructionReportStatus
          extend Api::BF::Enums::Concerns::Enumable

          enumify "SUCCESS",
                  "FAILURE",
                  "TIMEOUT"

        end
      end
    end
  end
end