module BetfairApiNgRails
  module Api
    module Enums
      class MarketStatus
        extend Api::Enums::Concerns::Enumable

        enumify "INACTIVE",
                "OPEN",
                "SUSPENDED",
                "CLOSED"

      end
    end
  end
end