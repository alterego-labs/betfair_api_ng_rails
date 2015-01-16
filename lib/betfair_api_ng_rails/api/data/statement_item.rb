module BetfairApiNgRails
  module Api
    module Data
      #
      # Summary of a cleared order.
      #
      class StatementItem < Api::Data::Base
        STATEMENT_ITEM_ATTRS = [
          :ref_id,
          :item_date,
          :amount,
          :balance,
          :item_class,
          :item_class_data,
          { legacy_data: { type: BetfairApiNgRails::StatementLegacyData } }
        ]

        attributes STATEMENT_ITEM_ATTRS
      end
    end
  end
end


