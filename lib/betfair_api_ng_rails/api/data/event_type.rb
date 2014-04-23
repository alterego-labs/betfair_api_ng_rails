module BetfairApiNgRails
  module Api
    module Data
      class EventType < Api::Data::Base
        include Api::Data::Concerns::Hashable

        EVENT_TYPE_ATTRS = [
          :id,
          :name
        ]

        attributes EVENT_TYPE_ATTRS

        def self.to_hash_attrs
          EVENT_TYPE_ATTRS
        end

      end
    end
  end
end