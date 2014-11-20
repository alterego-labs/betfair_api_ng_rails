module BetfairApiNgRails
  module Api
    module Parsers
      class ListVenues < Api::Parsers::ListBase
        private

        def data_class
          Api::Data::VenueResult
        end
      end
    end
  end
end
