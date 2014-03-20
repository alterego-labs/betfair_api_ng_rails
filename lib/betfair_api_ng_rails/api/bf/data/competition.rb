module BetfairApiNgRails
  module Api
    module BF
      module Data
        class Competition

          attr_accessor :id,
                        :name


          def self.where(filter: Api::BF::Data::MarketFilter.new, params: {})
            BetfairApiNgRails::Api::BF::ORM::Requester.load resource: :competitions, filter: filter, params: params
          end

          def self.all
            where
          end

          def self.find(id)
            where filter: Api::BF::Data::MarketFilter.new(competition_ids: [id])
          end

        end
      end
    end
  end
end