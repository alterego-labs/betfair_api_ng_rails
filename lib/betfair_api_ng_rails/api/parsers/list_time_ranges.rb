module BetfairApiNgRails
  module Api
    module Parsers
      class ListTimeRanges < Api::Parsers::Base

      private

        def process_row(json_row)
          Api::Data::TimeRangeResult.from_json json_row
        end

      end
    end
  end
end