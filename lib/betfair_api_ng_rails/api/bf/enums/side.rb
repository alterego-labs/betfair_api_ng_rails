module BetfairApiNgRails
  module Api
    module BF
      module Enums
        class Side
          extend Api::BF::Enums::Concerns::Enumable

          enumify "BACK",
                  "LAY"

        end
      end
    end
  end
end