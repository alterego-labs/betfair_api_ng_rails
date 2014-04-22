module BetfairApiNgRails
  module Api
    module Data
      class MarketCatalogue < Api::Data::Base

        MARKET_CATALOGUE_ATTRS = [
          :market_id,
          :market_name,
          :market_start_time,
          :total_matched,
          {description: { type: BetfairApiNgRails::MarketDescription          }},
          {runners:     { type: BetfairApiNgRails::RunnerCatalog, array: true }},
          {event_type:  { type: BetfairApiNgRails::EventType                  }},
          {competition: { type: BetfairApiNgRails::Competition                }},
          {event:       { type: BetfairApiNgRails::Event                      }}
        ]

        attributes MARKET_CATALOGUE_ATTRS

      end
    end
  end
end