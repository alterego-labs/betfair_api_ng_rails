module BetfairApiNgRails
  module Api
    module Data
      module Concerns
        module Jsonable

          def self.included(base)
            base.send :extend, ClassMethods
          end

          module ClassMethods
            
            def to_json(data = {})
              return nil unless self.respond_to?(:class_attrs)
              self.new set_attributes(data)
            end

          private

            def set_attributes(data)
              self.class_attrs.each_with_object({}) do |attrib, h|
                h[attrib] = data[json_key(attrib)]
              end
            end

            def json_key(attrib)
              attrib.to_s.camelize(:lower)
            end

          end

        end
      end
    end
  end
end