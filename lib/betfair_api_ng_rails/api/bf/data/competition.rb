module BetfairApiNgRails
  module Api
    module BF
      module Data
        class Competition < Api::BF::Data::Base
          include BetfairApiNgRails::Api::BF::Data::Attributes
          extend BetfairApiNgRails::Api::BF::Data::Concerns::Querable

          attr_accessor *COMPETITION_ATTRS

          querable :competitions, :competition_ids

          def self.from_json(json_row)
            new COMPETITION_ATTRS.inject({}) { |h, a| h[a] = json_row[a.to_s.camelize(:lower)]; h }
          end

        end
      end
    end
  end
end