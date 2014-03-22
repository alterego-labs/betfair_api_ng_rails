module BetfairApiNgRails
  module Api
    module BF
      module Enums
        class OrderProjection
          extend Api::BF::Enums::Concerns::Enumable

          enumify "ALL",
                  "EXECUTABLE",
                  "EXECUTION_COMPLETE"

        end
      end
    end
  end
end