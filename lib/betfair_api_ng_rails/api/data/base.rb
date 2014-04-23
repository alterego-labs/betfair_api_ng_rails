require 'active_support/inflector'

module BetfairApiNgRails
  module Api
    module Data
      class Base
        include Api::Data::Concerns::Attributable
        include Api::Data::Concerns::Jsonable

        # include Api::Data::Attributes
        # extend  Api::Data::Attributes

        def initialize(args = {})
          args.each { |attribute, value| self.send("#{attribute}=", value) }
        end

      end
    end
  end
end