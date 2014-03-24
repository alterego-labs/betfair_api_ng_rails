require 'json'
require 'active_support/inflector'

module BetfairApiNgRails
  module Api
    module BF
      module Formatters
        class JsTreeFormatter

          ALLOW_CHILDREN = [:event_types, :competitions]

          def format(record: nil, resource: "")
            return {} unless record
            obj = record.send resource.to_s.singularize
            {
              id: obj.id,
              text: obj.name,
              children: ALLOW_CHILDREN.include?(resource.to_sym),
              data:{
                type: resource.to_s.singularize,
                fields: obj.to_hash
              }
            }
          end

        end
      end
    end
  end
end