module BetfairApiNgRails
  module Api
    module Enums
      class OrderProjection
        extend Api::Enums::Concerns::Enumable

        enumify "ALL",
                "EXECUTABLE",
                "EXECUTION_COMPLETE"

      end
    end
  end
end