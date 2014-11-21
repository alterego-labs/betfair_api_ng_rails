module BetfairApiNgRails
  module Api
    module Data
      class CompetitionResult < Api::Data::Base
        COMPETITION_RESULT_ATTRS = [
          :market_count,
          :competition_region,
          {competition: {type: BetfairApiNgRails::Competition} }
        ]

        attributes COMPETITION_RESULT_ATTRS
      end
    end
  end
end
