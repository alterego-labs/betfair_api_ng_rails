module BetfairApiNgRails
  module Api
    module BF
      module Data
        class EventType < Api::BF::Data::Base
          include Api::BF::Data::Attributes
          extend Api::BF::Data::Concerns::Querable

          attr_accessor *EVENT_TYPE_ATTRS

          querable :event_types, :event_type_ids

          def self.from_json(json_row)
            new EVENT_TYPE_ATTRS.inject({}) { |h, a| h[a] = json_row[a.to_s]; h }
          end

        end
      end
    end
  end
end