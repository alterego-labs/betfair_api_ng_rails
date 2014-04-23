module BetfairApiNgRails
  module Api
    module Data
      class CountryCodeResult < Api::Data::Base

        COUNTRY_CODE_RESULT_ATTRS = [
          :market_count,
          :country_code
        ]

        attributes COUNTRY_CODE_RESULT_ATTRS

      end
    end
  end
end