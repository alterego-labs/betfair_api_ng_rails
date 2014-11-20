module BetfairApiNgRails
  module Api
    module Enums
      #
      # Either EXECUTABLE (an unmatched amount remains) or EXECUTION_COMPLETE (no unmatched amount remains).
      #
      # Includes:
      # EXECUTION_COMPLETE - An order that does not have any remaining unmatched portion.
      # EXECUTABLE         - An order that has a remaining unmatched portion.
      class OrderStatus
        extend Api::Enums::Concerns::Enumable

        enumify "EXECUTION_COMPLETE",
                "EXECUTABLE"

      end
    end
  end
end
