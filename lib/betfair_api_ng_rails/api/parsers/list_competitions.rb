module BetfairApiNgRails
  module Api
    module Parsers
      class ListCompetitions < Api::Parsers::Base

      private

        def process_row(json_row)
          Api::Data::CompetitionResult.from_json json_row
        end

      end
    end
  end
end