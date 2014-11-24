module BetfairApiNgRails
  module Api
    module Parsers
      class GetAccountFunds < Api::Parsers::SingleBase
        private

        def data_class
          Api::Data::AccountFundsResponse
        end
      end
    end
  end
end

