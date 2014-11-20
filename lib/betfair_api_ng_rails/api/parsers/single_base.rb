module BetfairApiNgRails
  module Api
    module Parsers
      class SingleBase < Api::Parsers::Base
        def process
          process_row fetch_result_json
        end

        private

        def default_value
          "{}"
        end
      end
    end
  end
end


