module BetfairApiNgRails
  module Api
    module Parsers
      class GetAccountStatement < Api::Parsers::SingleBase
        private

        def data_class
          Api::Data::AccountStatementReport
        end
      end
    end
  end
end


