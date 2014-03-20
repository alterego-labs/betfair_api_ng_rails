module BetfairApiNgRails
  module Api
    module BF
      module Data
        class Competition

          attr_accessor :id,
                        :name

          def initialize(args = {})
            args.each { |attribute, value| self.send("#{attribute}=", value) }
          end

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
              new(
                id: json_row['id'],
                name: json_row['name']
              )
            end

          end

        end
      end
    end
  end
end