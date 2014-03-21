module BetfairApiNgRails
  module Api
    module BF
      module Data
        class Event < Api::BF::Data::Base
          include Api::BF::Data::Attributes
          extend Api::BF::Data::Concerns::Querable

          attr_accessor *EVENT_ATTRS

          querable :events, :event_ids

          def self.from_json(json_row)
            new EVENT_ATTRS.inject({}) { |h, a| h[a] = json_row[a.to_s.camelize(:lower)]; h }
          end

        end
      end
    end
  end
end