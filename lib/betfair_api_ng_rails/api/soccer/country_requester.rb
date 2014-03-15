module BetfairApiNgRails
  class Api::Soccer::CountryRequester < BetfairApiNgRails::Api::Soccer::Requester

    def initialize(provider: '')
      @data = :country
      super provider
    end

  end
end