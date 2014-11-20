module BetfairApiNgRails
  module Api
    module Parsers
      class ListTimeRanges < Api::Parsers::ListBase
        private

        def data_class
          Api::Data::TimeRangeResult
        end
      end
    end
  end
end
