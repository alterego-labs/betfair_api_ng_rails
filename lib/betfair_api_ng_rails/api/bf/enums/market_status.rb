module BetfairApiNgRails
  module Api
    module BF
      module Enums
        class MarketStatus
          extend Api::BF::Enums::Concerns::Enumable

          enumify "INACTIVE",
                  "OPEN",
                  "SUSPENDED",
                  "CLOSED"

        end
      end
    end
  end
end