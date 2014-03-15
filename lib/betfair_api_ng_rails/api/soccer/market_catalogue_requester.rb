module BetfairApiNgRails
  class Api::Soccer::MarketCatalogueRequester < BetfairApiNgRails::Api::Soccer::Requester

    def initialize(provider: '')
      @data = :market_catalogue
      super provider
    end

  end
end