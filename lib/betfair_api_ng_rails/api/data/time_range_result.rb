module BetfairApiNgRails
  module Api
    module Data
      class TimeRangeResult < Api::Data::Base

        TIME_RANGE_RESULT_ATTRS = [
          {time_range: {type: BetfairApiNgRails::TimeRange}},
          :market_count
        ]

        attributes TIME_RANGE_RESULT_ATTRS

      end
    end
  end
end