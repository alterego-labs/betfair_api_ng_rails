module BetfairApiNgRails
  module Api
    module BF
      module Data
        class TimeRangeResult < Api::BF::Data::Base

          attr_accessor :time_range,
                        :market_count

        end
      end
    end
  end
end