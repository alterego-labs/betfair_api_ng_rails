module BetfairApiNgRails
  module Api
    module Enums
      # Class of statement item
      #
      # Includes:
      # UNKNOWN - Statement item not mapped to a specific class.
      #
      class ItemClass
        extend Api::Enums::Concerns::Enumable

        enumify "UNKNOWN"
      end
    end
  end
end



