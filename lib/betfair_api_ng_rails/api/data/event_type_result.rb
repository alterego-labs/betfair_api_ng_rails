module BetfairApiNgRails
  module Api
    module Data
      class EventTypeResult < Api::Data::Base

        attr_accessor :market_count,
                      :event_type

        def self.from_json(json_row)
          new(
            event_type: Api::Data::EventType.from_json(json_row['eventType']),
            market_count: json_row['marketCount'],
          )
        end

      end
    end
  end
end