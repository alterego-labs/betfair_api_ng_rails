module BetfairApiNgRails
  module Api
    module Enums
      class BetStatus
        extend Api::Enums::Concerns::Enumable

        enumify "SETTLED",
                "VOIDED",
                "LAPSED",
                "CANCELLED"

      end
    end
  end
end