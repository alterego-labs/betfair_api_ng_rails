module BetfairApiNgRails
  module Api
    module BF
      module Data
        module Concerns
          module Querable

            def querable(resource, find_attr = false)
              methods = <<-CODE
                #{where_query_method(resource)}
                #{all_query_method}
                #{find_query_method(find_attr) if find_attr}
              CODE
              instance_eval(methods)
            end

          private

            def where_query_method(resource)
              <<-STR
                def where(filter: Api::BF::Data::MarketFilter.new, params: {})
                  Api::BF::ORM::Requester.load resource: :#{resource}, filter: filter, params: params
                end
              STR
            end

            def all_query_method
              <<-STR
                def all; where; end;
              STR
            end

            def find_query_method(find_attr)
              <<-STR
                def find(id)
                  where filter: Api::BF::Data::MarketFilter.new(#{find_attr}: [id])
                end
              STR
            end

          end
        end
      end
    end
  end
end