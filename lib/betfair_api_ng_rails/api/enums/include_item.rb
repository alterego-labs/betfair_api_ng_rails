module BetfairApiNgRails
  module Api
    module Enums
      # Specifies item type to include for account statement report
      #
      # Includes:
      # ALL                  - Include all items
      # DEPOSITS_WITHDRAWALS - Include payments only
      # EXCHANGE             - Include exchange bets only
      # POKER_ROOM           - Include poker transactions only
      #
      class IncludeItem
        extend Api::Enums::Concerns::Enumable

        enumify "ALL",
                "DEPOSITS_WITHDRAWALS",
                "EXCHANGE",
                "POKER_ROOM"
      end
    end
  end
end

