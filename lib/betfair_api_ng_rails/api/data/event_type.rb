module BetfairApiNgRails
  module Api
    module Data
      class EventType < Api::Data::Base
        include Api::Data::Attributes
        extend  Api::Data::Concerns::Querable
        include Api::Data::Concerns::Hashable

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