module BetfairApiNgRails
  module Api
    module Parsers
      class ListCompetitions < Api::Parsers::ListBase
        private

        def data_class
          Api::Data::CompetitionResult
        end
      end
    end
  end
end
