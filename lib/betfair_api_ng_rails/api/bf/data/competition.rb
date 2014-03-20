module BetfairApiNgRails
  module Api
    module BF
      module Data
        class Competition

          attr_accessor :id,
                        :name

          def self.fetch(filter: Api::BF::Data::MarketFilter.new, params: {})
            BetfairApiNgRails::Api::BF::ORM::Requester.load resource: :competitions, filter: filter, params: params
          end

        end
      end
    end
  end
end