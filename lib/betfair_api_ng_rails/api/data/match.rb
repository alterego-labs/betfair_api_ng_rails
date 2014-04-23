module BetfairApiNgRails
  module Api
    module Data
      class Match < Api::Data::Base

        MATCH_ATTRS = [
          :bet_id,
          :match_id,
          :side,
          :price,
          :size,
          :match_date
        ]

        attributes MATCH_ATTRS
      end
    end
  end
end