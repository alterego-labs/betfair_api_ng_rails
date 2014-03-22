module BetfairApiNgRails
  module Api
    module BF
      module Enums
        class BetStatus
          extend Api::BF::Enums::Concerns::Enumable

          enumify "SETTLED",
                  "VOIDED",
                  "LAPSED",
                  "CANCELLED"

        end
      end
    end
  end
end