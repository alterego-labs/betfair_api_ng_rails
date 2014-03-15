module BetfairApiNgRails
  class Api::Soccer::MarketTypeRequester < BetfairApiNgRails::Api::Soccer::Requester

    def initialize(provider: '')
      @data = :market_type
      super provider
    end

  end
end