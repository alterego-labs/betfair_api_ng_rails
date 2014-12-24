require 'json'
require 'active_support/inflector'

module BetfairApiNgRails
  module Api
    module Formatters
      class JsTreeFormatter
        ALLOW_CHILDREN = [:event_types, :competitions]

        def process(result, as: '')
          result.map { |r| format_record(r, resource_from_method(as)) }
        end

        private

        def resource_from_method(method)
          method.underscore.gsub(/^list_/, '').to_sym
        end

        def format_record(record, resource)
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
