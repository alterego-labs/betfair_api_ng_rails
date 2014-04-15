module BetfairApiNgRails
  module Api
    module Data
      class TimeRangeResult < Api::Data::Base

        attr_accessor :time_range,
                      :market_count

        def self.from_json(json_row)
          new(
            time_range: Api::Data::TimeRange.from_json(json_row['timeRange']),
            market_count: json_row['marketCount'],
          )
        end

      end
    end
  end
end