module BetfairApiNgRails
  module Api
    module Parsers
      class ListEventTypes < Api::Parsers::ListBase
        private

        def data_class
          Api::Data::EventTypeResult
        end
      end
    end
  end
end
