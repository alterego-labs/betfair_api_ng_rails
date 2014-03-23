module BetfairApiNgRails
  module Api
    module BF
      module Data
        module Concerns
          module Hashable
            include BetfairApiNgRails::Api::BF::Data::Constants

            def to_hash
              to_hash_attrs.inject({}) do |h, attrib|
                val = get_attr_value(attrib)
                h[hash_key(attrib)] = hash_value(val) unless val.nil?
                h
              end
            end

          private

            def hash_value(val)
              need_to_hash?(val) ? val.to_hash : val
            end

            def need_to_hash?(val)
              !ATTRS_AS_IS.include?(val.class)
            end

            def get_attr_value(attrib)
              self.send attrib
            end

            def hash_key(attrib)
              attrib.to_s.camelize(:lower)
            end

          end
        end
      end
    end
  end
end