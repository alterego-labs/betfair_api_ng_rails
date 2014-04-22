module BetfairApiNgRails
  module Api
    module Data
      module Concerns
        module Jsonable

          def self.included(base)
            base.send :extend, ClassMethods
          end

          module ClassMethods
            
            def from_json(data = {})
              return nil unless self.respond_to?(:class_attrs)
              self.new set_attributes(data)
            end

          private

            def set_attributes(data)
              self.class_attrs.each_with_object({}) do |(name, options), h|
                h[name] = get_attr_value(data, name, options)
              end
            end

            def json_key(attrib)
              attrib.to_s.camelize(:lower)
            end

            def get_attr_value(data, name, options)
              j_data = data[json_key(name)]
              return nil unless j_data
              options[:array] ? j_data.map { |r| prepare_value(options[:type], r) } : prepare_value(options[:type], j_data)
            end

            def prepare_value(type, data)
              type == String ? data : type.from_json(data)
            end

          end

        end
      end
    end
  end
end