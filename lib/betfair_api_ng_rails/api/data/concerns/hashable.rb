module BetfairApiNgRails
  module Api
    module Data
      module Concerns
        module Hashable
          include BetfairApiNgRails::Api::Data::Constants

          def to_hash
            BetfairApiNgRails::Api::Hashalator.new(attributes_hash).to_hash
          end

        private

          def attributes_hash
            self.class.to_hash_attrs.each_with_object({}) do |a, h|
              key = get_attr_key(a)
              val = get_attr_value(key)
              h[get_attr_key(key)] = val unless val.nil?
            end
          end

          def get_attr_value(attrib)
            self.send attrib
          end

          def get_attr_key(attrib)
            attrib.is_a?(Hash) ? attrib.keys.first : attrib
          end

        end
      end
    end
  end
end