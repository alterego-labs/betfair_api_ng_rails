module BetfairApiNgRails
  module Api
    module Data
      class Competition < Api::Data::Base
        include Api::Data::Concerns::Hashable

        COMPETITION_ATTRS = [
          :id,
          :name
        ]

        attributes COMPETITION_ATTRS

        def self.to_hash_attrs
          COMPETITION_ATTRS
        end
      end
    end
  end
end
