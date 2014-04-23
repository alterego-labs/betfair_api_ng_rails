module BetfairApiNgRails
  module Api
    module Data
      class EventResult < Api::Data::Base

        EVENT_RESULT_ATTRS = [
          :market_count,
          {event: { type: BetfairApiNgRails::Event }}
        ]

        attributes EVENT_RESULT_ATTRS

      end
    end
  end
end