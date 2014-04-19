module BetfairApiNgRails
  module Api
    module Data
      class MarketTypeResult < Api::Data::Base

        attr_accessor :market_count,
                      :market_type

        def self.from_json(json_row)
          new(
            market_type: json_row['marketType'],
            market_count: json_row['marketCount']
          )
        end

      end
    end
  end
end