module BetfairApiNgRails
  module Api
    module Data
      class EventTypeResult < Api::Data::Base

        EVENT_TYPE_RESULT_ATTRS = [
          :market_count,
          {event_type: {type: BetfairApiNgRails::EventType}}
        ]

        attributes EVENT_TYPE_RESULT_ATTRS

      end
    end
  end
end