module BetfairApiNgRails
  module Api
    module Parsers
      class ListBase < Api::Parsers::Base
        def process
          fetch_result_json.map { |json_row| process_row json_row }
        end

        private

        def default_value
          []
        end
      end
    end
  end
end

