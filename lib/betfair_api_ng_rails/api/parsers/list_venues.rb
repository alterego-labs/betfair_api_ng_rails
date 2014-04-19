module BetfairApiNgRails
  module Api
    module Parsers
      class ListVenues < Api::Parsers::Base

      private

        def process_row(json_row)
          Api::Data::VenueResult.from_json json_row
        end

      end
    end
  end
end