module BetfairApiNgRails
  module Api
    module BF
      module ORM
        class Requester
          class << self

            def load(resource: "", filter: Api::BF::Data::MarketFilter.new, params: {})
              current_provider.fetch {
                method: build_function(resource),
                filter: filter,
                params: params
              }
            end

          private

            def build_function(method)
              "list#{method.to_s.camelize}"
            end

            def current_provider
              @_current_provider ||= BetfairApiNgRails::Api::BF::Provider.new
            end

          end
        end
      end
    end
  end
end