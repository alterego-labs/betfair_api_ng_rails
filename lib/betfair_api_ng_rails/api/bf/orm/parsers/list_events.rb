module BetfairApiNgRails
  module Api
    module BF
      module ORM
        module Parsers
          class ListEvents < Api::BF::ORM::Parsers::Base

          private

            def process_row(json_row)
              Api::BF::Data::EventResult.from_json json_row
            end

          end
        end
      end
    end
  end
end