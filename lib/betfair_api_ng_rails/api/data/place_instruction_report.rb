module BetfairApiNgRails
  module Api
    module Data
      class PlaceInstructionReport < Api::Data::Base
        include Api::Data::Concerns::Hashable

        PLACE_INSTRUCTION_REPORT_ATTRS = [
          :status,
          :error_code,
          {instruction: {type: BetfairApiNgRails::PlaceInstruction}},
          :bet_id,
          :placed_date,
          :average_price_matched,
          :size_matched
        ]

        attributes PLACE_INSTRUCTION_REPORT_ATTRS

        def self.to_hash_attrs
          PLACE_INSTRUCTION_REPORT_ATTRS
        end
      end
    end
  end
end


