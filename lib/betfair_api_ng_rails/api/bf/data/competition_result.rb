module BetfairApiNgRails
  module Api
    module BF
      module Data
        class CompetitionResult < Api::BF::Data::Base

          attr_accessor :market_count,
                        :competition_region,
                        :competition

          def self.from_json(json_row)
            new(
              competition: Api::BF::Data::Competition.from_json(json_row['competition']),
              market_count: json_row['marketCount'],
              competition_region: json_row['competitionRegion']
            )
          end

        end
      end
    end
  end
end