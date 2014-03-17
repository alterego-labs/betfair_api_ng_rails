require 'active_support/inflector'

module BetfairApiNgRails
  module Api
    module BF
      class Parser < Api::BaseParser

        attr_reader :data

        def initialize(data)
          @data = data
        end

        def parse(response: {})
          response.fetch('result', []).map { |r| process_record(r) }
        end

      private

        def resource_key
          data.camelize :lower
        end

        def process_record(h)
          h.merge!(h[resource_key]).except resource_key
        end

      end
    end
  end
end