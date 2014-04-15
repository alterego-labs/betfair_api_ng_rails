module BetfairApiNgRails
  module Api
    module Enums
      class OrderType
        extend Api::Enums::Concerns::Enumable

        enumify "LIMIT",
                "LIMIT_ON_CLOSE",
                "MARKET_ON_CLOSE"

      end
    end
  end
end