module BetfairApiNgRails
  module Api
    module Data
      class MarketCatalogue < Api::Data::Base

        attr_accessor *MARKET_CATALOGUE_ATTRS

        def self.from_json(json_row)
          new(
            market_id:         json_row['marketId'],
            market_name:       json_row['marketName'],
            market_start_time: json_row['marketStartTime'],
            description:       json_row['description'],
            total_matched:     json_row['totalMatched']
          ).tap do |mc|
            mc.event_type  = BetfairApiNgRails::EventType.from_json(json_row['eventType'])   if json_row.has_key?('eventType')
            mc.competition = BetfairApiNgRails::EventType.from_json(json_row['competition']) if json_row.has_key?('competition')
            mc.event       = BetfairApiNgRails::EventType.from_json(json_row['event'])       if json_row.has_key?('event')
            mc.runners     = json_row.fetch('runners', []).map {|r| BetfairApiNgRails::RunnerCatalog.from_json(r) }
          end
        end

      end
    end
  end
end