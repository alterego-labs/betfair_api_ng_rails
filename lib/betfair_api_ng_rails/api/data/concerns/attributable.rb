module BetfairApiNgRails
  module Api
    module Data
      module Concerns
        module Attributable

          def self.included(base)
            base.send :extend, ClassMethods
          end

          module ClassMethods
            
            def attributes(attrs)
              define_class_attrs attrs
              define_attr_accessors
            end

          private

            def define_class_attrs(attrs)
              class << self; attr_accessor :class_attrs; end
              self.class_attrs = attrs
            end

            def define_attr_accessors
              self.class_attrs.each { |attrib| class_eval("attr_accessor :#{fetch_attr_name(attrib)}") }
            end

            def fetch_attr_name(attrib)
              attrib.is_a?(Hash) ? attrib.keys.first : attrib
            end

          end

        end
      end
    end
  end
end