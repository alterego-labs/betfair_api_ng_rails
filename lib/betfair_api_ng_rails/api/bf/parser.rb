require 'active_support/inflector'

module BetfairApiNgRails
  module Api
    module BF
      class Parser < Api::BaseParser

        attr_reader :data

        def initialize(data)
          @data = data
        end

      private

        def process_record(h)
          h.merge!(h[data]).except data
        end

      end
    end
  end
end