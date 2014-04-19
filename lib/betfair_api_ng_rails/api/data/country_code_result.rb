module BetfairApiNgRails
  module Api
    module Data
      class CountryCodeResult < Api::Data::Base

        attr_accessor :market_count,
                      :country_code

        def self.from_json(json_row)
          new(
            country_code: json_row['countryCode'],
            market_count: json_row['marketCount']
          )
        end

      end
    end
  end
end