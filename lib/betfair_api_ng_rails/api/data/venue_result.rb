module BetfairApiNgRails
  module Api
    module Data
      class VenueResult < Api::Data::Base

        VENUE_RESULT_ATTRS = [
          :market_count,
          :venue
        ]

        attributes VENUE_RESULT_ATTRS

      end
    end
  end
end