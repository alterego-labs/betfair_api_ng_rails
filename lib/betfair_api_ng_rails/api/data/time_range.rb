module BetfairApiNgRails
  module Api
    module Data
      class TimeRange < Api::Data::Base
        include Api::Data::Concerns::Hashable

        TIME_RANGE_ATTRS = [
          :from,
          :to
        ]

        attributes TIME_RANGE_ATTRS

        def self.to_hash_attrs
          TIME_RANGE_ATTRS
        end

      end
    end
  end
end