module BetfairApiNgRails
  module Api
    module Enums
      # Which wallet to return statementItems for
      #
      # Includes:
      # UK         - The UK Exchange wallet
      # AUSTRALIAN - The Australian Exchange wallet
      #
      class Wallet
        extend Api::Enums::Concerns::Enumable

        enumify "UK",
                "AUSTRALIAN"
      end
    end
  end
end


