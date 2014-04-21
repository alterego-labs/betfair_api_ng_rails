module BetfairApiNgRails
  module Api
    module Data
      class MarketDescription < Api::Data::Base

        attr_accessor *MARKET_DESCRIPTION_ATTRS

        def self.from_json(json_row)
          new MARKET_DESCRIPTION_ATTRS.inject({}) { |h, a| h[a] = json_row[a.to_s.camelize(:lower)]; h }
        end

      end
    end
  end
end