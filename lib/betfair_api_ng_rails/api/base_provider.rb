require 'active_support/inflector'

module Api
  class BaseProvider

    def fetch(data: "", parameters: {}, sport: "")
      raise "Must be reimplemented!"
    end

  private

    def build_function(method)
      "list#{method.to_s.pluralize.camelize}"
    end

    def build_parser(data, sport)
      "Api::BF::Parsers::#{sport.to_s.camelize}::#{data.to_s.camelize}Parser".constantize.new
    end

  end
end