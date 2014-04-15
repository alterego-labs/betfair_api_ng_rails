module BetfairApiNgRails
  module Api
    module ORM
      module Parsers
        class ListEvents < Api::ORM::Parsers::Base

        private

          def process_row(json_row)
            Api::Data::EventResult.from_json json_row
          end

        end
      end
    end
  end
end