module BetfairApiNgRails
  module Api
    module BF
      module Data
        class TimeRangeResult < Api::BF::Data::Base

          attr_accessor :time_range,
                        :market_count

          def self.from_json(json_row)
            new(
              time_range: Api::BF::Data::TimeRange.from_json(json_row['timeRange']),
              market_count: json_row['marketCount'],
            )
          end

        end
      end
    end
  end
end