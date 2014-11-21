module BetfairApiNgRails
  module Api
    module Enums
      #
      # Indicates if the bet is a Back or a LAY
      #
      # Includes:
      # BACK - To back a team, horse or outcome is to bet on the selection to win.
      # LAY  - To lay a team, horse, or outcome is to bet on the selection to lose.
      class Side
        extend Api::Enums::Concerns::Enumable

        enumify "BACK",
                "LAY"
      end
    end
  end
end
