module BetfairApiNgRails
  module Api
    module BF
      module Data
        class EventType < Api::BF::Data::Base
          include Api::BF::Data::Attributes
          extend Api::BF::Data::Concerns::Querable
          include Api::BF::Data::Concerns::Hashable

          attr_accessor *EVENT_TYPE_ATTRS

          querable :event_types, :event_type_ids

          def self.from_json(json_row)
            new EVENT_TYPE_ATTRS.inject({}) { |h, a| h[a] = json_row[a.to_s.camelize(:lower)]; h }
          end

          def self.to_hash_attrs
            EVENT_TYPE_ATTRS
          end

        end
      end
    end
  end
end