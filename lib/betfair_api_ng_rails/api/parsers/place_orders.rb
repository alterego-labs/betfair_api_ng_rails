module BetfairApiNgRails
  module Api
    module Parsers
      class PlaceOrders < Api::Parsers::SingleBase
        private

        def data_class
          Api::Data::PlaceExecutionReport
        end
      end
    end
  end
end

