module BetfairApiNgRails
  module Api
    module Data
      class PlaceExecutionReport < Api::Data::Base
        include Api::Data::Concerns::Hashable

        PLACE_EXECUTION_REPORT_ATTRS = [
          :customer_ref,
          :status,
          :error_code,
          :market_id,
          {instruction_reports: {type: BetfairApiNgRails::PlaceInstructionReport, array: true}}
        ]

        attributes PLACE_EXECUTION_REPORT_ATTRS

        def self.to_hash_attrs
          PLACE_EXECUTION_REPORT_ATTRS
        end
      end
    end
  end
end

