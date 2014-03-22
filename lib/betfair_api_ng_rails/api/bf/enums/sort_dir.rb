module BetfairApiNgRails
  module Api
    module BF
      module Enums
        class SortDir
          extend Api::BF::Enums::Concerns::Enumable

          enumify "EARLIEST_TO_LATEST",
                  "LATEST_TO_EARLIEST"

        end
      end
    end
  end
end