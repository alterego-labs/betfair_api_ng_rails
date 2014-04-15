module BetfairApiNgRails
  module Api
    module ORM
      module Parsers
        class ListEventTypes < Api::ORM::Parsers::Base

        private

          def process_row(json_row)
            Api::Data::EventTypeResult.from_json json_row
          end

        end
      end
    end
  end
end