module BetfairApiNgRails
  module Api
    module Data
      class Event < Api::Data::Base
        include Api::Data::Concerns::Hashable

        EVENT_ATTRS = [
          :id,
          :name,
          :timezone,
          :country_code,
          :venue,
          :open_date
        ]

        attributes EVENT_ATTRS

        def self.to_hash_attrs
          EVENT_ATTRS
        end

      end
    end
  end
end