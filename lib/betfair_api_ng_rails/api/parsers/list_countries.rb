module BetfairApiNgRails
  module Api
    module Parsers
      class ListCountries < Api::Parsers::ListBase
        private

        def data_class
          Api::Data::CountryCodeResult
        end
      end
    end
  end
end
