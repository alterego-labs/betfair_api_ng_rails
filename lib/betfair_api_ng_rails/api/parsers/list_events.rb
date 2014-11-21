module BetfairApiNgRails
  module Api
    module Parsers
      class ListEvents < Api::Parsers::ListBase
        private

        def data_class
          Api::Data::EventResult
        end
      end
    end
  end
end
