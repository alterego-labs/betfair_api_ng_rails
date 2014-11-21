require 'active_support/inflector'

module BetfairApiNgRails
  module Api
    module ConnectionExt
      module Parsing
        def self.included(base)
          base.send :class_eval,  <<-CODE
            def request_with_parsing(method, params = {})
              res = request_without_parsing(method, params)
              init_parser(method, res).process
            end
            alias_method :request_without_parsing, :request
            alias_method :request, :request_with_parsing
          CODE
        end

        private

        def init_parser(method, responser)
          "BetfairApiNgRails::Api::Parsers::#{method.camelize}".constantize.new responser
        end
      end
    end
  end
end
