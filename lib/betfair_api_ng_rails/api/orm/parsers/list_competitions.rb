module BetfairApiNgRails
  module Api
    module ORM
      module Parsers
        class ListCompetitions < Api::ORM::Parsers::Base

        private

          def process_row(json_row)
            Api::Data::CompetitionResult.from_json json_row
          end

        end
      end
    end
  end
end