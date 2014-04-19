module BetfairApiNgRails
  module Api
    module Data
      class VenueResult < Api::Data::Base

        attr_accessor :market_count,
                      :venue

        def self.from_json(json_row)
          new(
            venue: json_row['venue'],
            market_count: json_row['marketCount']
          )
        end

      end
    end
  end
end