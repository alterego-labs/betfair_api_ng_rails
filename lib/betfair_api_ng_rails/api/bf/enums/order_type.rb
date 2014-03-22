module BetfairApiNgRails
  module Api
    module BF
      module Enums
        class OrderType
          extend Api::BF::Enums::Concerns::Enumable

          enumify "LIMIT",
                  "LIMIT_ON_CLOSE",
                  "MARKET_ON_CLOSE"

        end
      end
    end
  end
end