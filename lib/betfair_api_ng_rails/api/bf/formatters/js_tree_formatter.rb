require 'json'
require 'active_support/inflector'

module BetfairApiNgRails
  module Api
    module BF
      module Formatters
        class JsTreeFormatter < BetfairApiNgRails::Api::BaseFormatter

          attr_accessor :allow_children

          ALLOW_CHILDREN = [:event_types, :competitions]

          def initialize
            @allow_children = false
          end

          def format(record: {}, resource: "")
            {
              id: record['id'],
              text: record['name'],
              chldren: ALLOW_CHILDREN.include?(resource),
              data:{
                type: resource.to_s.singularize,
                fields: record
              }
            }
          end

        end
      end
    end
  end
end