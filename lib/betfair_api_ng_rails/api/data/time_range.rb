module BetfairApiNgRails
  module Api
    module Data
      class TimeRange < Api::Data::Base
        include Api::Data::Concerns::Hashable

        attr_accessor *TIME_RANGE_ATTRS

        def self.from_json(json_row)
          new TIME_RANGE_ATTRS.inject({}) { |h, a| h[a] = json_row[a.to_s.camelize(:lower)]; h }
        end

        def self.to_hash_attrs
          TIME_RANGE_ATTRS
        end

      end
    end
  end
end