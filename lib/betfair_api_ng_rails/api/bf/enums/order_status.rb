module BetfairApiNgRails
  module Api
    module BF
      module Enums
        class OrderStatus
          extend Api::BF::Enums::Concerns::Enumable

          enumify "EXECUTION_COMPLETE",
                  "EXECUTABLE"

        end
      end
    end
  end
end