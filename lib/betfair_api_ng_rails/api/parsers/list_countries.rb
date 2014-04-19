module BetfairApiNgRails
  module Api
    module Parsers
      class ListCountries < Api::Parsers::Base

      private

        def process_row(json_row)
          Api::Data::CountryCodeResult.from_json json_row
        end

      end
    end
  end
end