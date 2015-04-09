module BetfairApiNgRails
  module Api
    module Parsers
      class Base
        attr_reader :responser

        def initialize(responser)
          @responser = responser
        end

        def process
          raise 'Must be reimplemented!'
        end

        private

        def fetch_result_json
          responser.has_error? ? default_value : responser.api_result
        rescue
          raise BetfairApiNgRails::BadResponseError
        end

        def default_value
          raise 'Must be reimplemented!'
        end

        def process_row(json_row)
          data_class.from_json json_row
        end

        def data_class
          raise 'Must be reimplemented!'
        end
      end
    end
  end
end
