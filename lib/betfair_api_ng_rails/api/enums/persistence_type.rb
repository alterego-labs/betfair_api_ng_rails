module BetfairApiNgRails
  module Api
    module Enums
      class PersistenceType
        extend Api::Enums::Concerns::Enumable

        enumify "LAPSE",
                "PERSIST",
                "MARKET_ON_CLOSE"

      end
    end
  end
end