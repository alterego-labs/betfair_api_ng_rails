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
            self.class.to_hash_attrs.each_with_object({}) { |a, h| h[a] = get_attr_value(a) }
          end

          def get_attr_value(attrib)
            self.send attrib
          end

        end
      end
    end
  end
end