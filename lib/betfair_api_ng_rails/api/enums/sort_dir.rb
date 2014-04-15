module BetfairApiNgRails
  module Api
    module Enums
      class SortDir
        extend Api::Enums::Concerns::Enumable

        enumify "EARLIEST_TO_LATEST",
                "LATEST_TO_EARLIEST"

      end
    end
  end
end