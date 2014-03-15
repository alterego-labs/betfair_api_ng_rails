module BetfairApiNgRails
  class Api::Soccer::MarketBookRequester < BetfairApiNgRails::Api::Soccer::Requester

    def initialize(provider: '')
      @data = :market_book
      super provider
    end

  end
end