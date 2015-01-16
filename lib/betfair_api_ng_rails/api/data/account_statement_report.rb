module BetfairApiNgRails
  module Api
    module Data
      #
      # A container representing search results.
      #
      class AccountStatementReport < Api::Data::Base
        ACCOUNT_STATEMENT_REPORT_ATTRS = [
          :more_available,
          { account_statement: { type: BetfairApiNgRails::StatementItem, array: true } }
        ]

        attributes ACCOUNT_STATEMENT_REPORT_ATTRS
      end
    end
  end
end
