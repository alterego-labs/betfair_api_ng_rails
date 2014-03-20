module BetfairApiNgRails
  module Api
    module BF
      module Data
        class TimeRange < Api::BF::Data::Base

          attr_accessor :from,
                        :to

        end
      end
    end
  end
end