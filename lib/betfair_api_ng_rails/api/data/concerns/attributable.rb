module BetfairApiNgRails
  module Api
    module Data
      module Concerns
        module Attributable
          DEFAULT_OPTIONS = { type: String, array: false }

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
              self.class_attrs = process_attributes(attrs)
            end

            def process_attributes(attrs)
              attrs.each_with_object({}) do |a, h|
                h[fetch_attr_name(a)] = fetch_attr_options(a)
              end
            end

            def define_attr_accessors
              self.class_attrs.each { |name, options| class_eval("attr_accessor :#{name}") }
            end

            def fetch_attr_name(attrib)
              attrib.is_a?(Hash) ? attrib.keys.first : attrib
            end

            def fetch_attr_options(attrib)
              attrib.is_a?(Hash) ? DEFAULT_OPTIONS.merge(attrib.values.first) : DEFAULT_OPTIONS
            end
          end
        end
      end
    end
  end
end
