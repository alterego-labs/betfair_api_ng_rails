module BetfairApiNgRails
  module Api
    module Data
      class EventResult < Api::Data::Base

        attr_accessor :market_count,
                      :event

        def self.from_json(json_row)
          new(
            event: Api::Data::Event.from_json(json_row['event']),
            market_count: json_row['marketCount']
          )
        end

      end
    end
  end
end