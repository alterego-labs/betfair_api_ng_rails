module BetfairApiNgRails
  module Api
    module Enums
      class Side
        extend Api::Enums::Concerns::Enumable

        enumify "BACK",
                "LAY"

      end
    end
  end
end