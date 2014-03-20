module BetfairApiNgRails
  module Api
    module BF
      module Data
        class Competition < Api::BF::Data::Base
          include BetfairApiNgRails::Api::BF::Data::Attributes

          attr_accessor *COMPETITION_ATTRS

          class << self

            def where(filter: Api::BF::Data::MarketFilter.new, params: {})
              BetfairApiNgRails::Api::BF::ORM::Requester.load resource: :competitions, filter: filter, params: params
            end

            def all
              where
            end

            def find(id)
              where filter: Api::BF::Data::MarketFilter.new(competition_ids: [id])
            end

            def from_json(json_row)
              new COMPETITION_ATTRS.inject({}) { |h, a| h[a] = json_row[a.to_s]; h }
            end

          end

        end
      end
    end
  end
end