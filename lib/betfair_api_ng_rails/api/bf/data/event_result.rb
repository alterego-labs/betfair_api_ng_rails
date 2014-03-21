module BetfairApiNgRails
  module Api
    module BF
      module Data
        class EventResult < Api::BF::Data::Base

          attr_accessor :market_count,
                        :event

          def self.from_json(json_row)
            new(
              event: Api::BF::Data::Event.from_json(json_row['event']),
              market_count: json_row['marketCount']
            )
          end

        end
      end
    end
  end
end