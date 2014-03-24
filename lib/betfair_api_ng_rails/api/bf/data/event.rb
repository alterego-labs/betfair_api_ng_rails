module BetfairApiNgRails
  module Api
    module BF
      module Data
        class Event < Api::BF::Data::Base
          include Api::BF::Data::Attributes
          extend Api::BF::Data::Concerns::Querable
          include Api::BF::Data::Concerns::Hashable

          attr_accessor *EVENT_ATTRS

          querable :events, :event_ids

          def self.from_json(json_row)
            new EVENT_ATTRS.inject({}) { |h, a| h[a] = json_row[a.to_s.camelize(:lower)]; h }
          end

          def self.to_hash_attrs
            EVENT_ATTRS
          end

        end
      end
    end
  end
end