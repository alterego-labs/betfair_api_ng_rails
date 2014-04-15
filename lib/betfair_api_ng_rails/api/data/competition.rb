module BetfairApiNgRails
  module Api
    module Data
      class Competition < Api::Data::Base
        include Api::Data::Attributes
        extend  Api::Data::Concerns::Querable
        include Api::Data::Concerns::Hashable

        attr_accessor *COMPETITION_ATTRS

        querable :competitions, :competition_ids

        def self.from_json(json_row)
          new COMPETITION_ATTRS.inject({}) { |h, a| h[a] = json_row[a.to_s.camelize(:lower)]; h }
        end

        def self.to_hash_attrs
          COMPETITION_ATTRS
        end

      end
    end
  end
end