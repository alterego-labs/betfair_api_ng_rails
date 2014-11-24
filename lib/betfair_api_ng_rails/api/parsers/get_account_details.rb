module BetfairApiNgRails
  module Api
    module Parsers
      class GetAccountDetails < Api::Parsers::SingleBase
        private

        def data_class
          Api::Data::AccountDetailsResponse
        end
      end
    end
  end
end
