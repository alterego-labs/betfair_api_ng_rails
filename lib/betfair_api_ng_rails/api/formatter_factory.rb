require 'active_support/core_ext/object'

module BetfairApiNgRails
  module Api
    class FormatterFactory
      class << self

        def initialize_formatter(name)
          name.is_a?(Symbol) ? initialize_formatter_by(name: name) : name.try(:new)
        end

      private

        def initialize_formatter_by(name: "")
          "BetfairApiNgRails::Api::Formatters::#{name.to_s.camelize}Formatter".constantize.new
        end

      end
    end
  end
end