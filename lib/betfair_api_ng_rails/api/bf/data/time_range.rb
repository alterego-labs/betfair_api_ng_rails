module BetfairApiNgRails
  module Api
    module BF
      module Data
        class TimeRange < Api::BF::Data::Base
          include Api::BF::Data::Attributes

          attr_accessor *TIME_RANGE_ATTRS

          def self.from_json(json_row)
            new TIME_RANGE_ATTRS.inject({}) { |h, a| h[a] = json_row[a.to_s.camelize(:lower)]; h }
          end

        end
      end
    end
  end
end