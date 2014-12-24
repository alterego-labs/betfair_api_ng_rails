module BetfairApiNgRails
  module Api
    class Hashalator
      include Api::Data::Constants

      attr_reader :hashable

      def initialize(object)
        @hashable = object
      end

      def to_hash
        hashable.inject({}) do |h, (k, v)|
          value = hash_value(v)
          h[hash_key(k)] = value if !value.nil? && value != ""
          h
        end
      end

      private

      def hash_value(val)
        need_to_hash?(val) ? hashing_val(val) : val
      end

      def hashing_val(val)
        val.is_a?(Array) ? val.map { |e| hash_value(e) } : val.to_hash
      end

      def need_to_hash?(val)
        !ATTRS_AS_IS.include?(val.class)
      end

      def hash_key(key)
        key.to_s.camelize(:lower)
      end
    end
  end
end
