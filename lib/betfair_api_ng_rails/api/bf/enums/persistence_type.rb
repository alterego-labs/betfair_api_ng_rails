module BetfairApiNgRails
  module Api
    module BF
      module Enums
        class PersistenceType
          extend Api::BF::Enums::Concerns::Enumable

          enumify "LAPSE",
                  "PERSIST",
                  "MARKET_ON_CLOSE"

        end
      end
    end
  end
end