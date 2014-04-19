module BetfairApiNgRails
  module Api
    module Parsers
      class ListEventTypes < Api::Parsers::Base

      private

        def process_row(json_row)
          Api::Data::EventTypeResult.from_json json_row
        end

      end
    end
  end
end