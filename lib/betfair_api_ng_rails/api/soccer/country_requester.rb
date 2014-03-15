module BetfairApiNgRails
  class Api::Soccer::CountryRequester < BetfairApiNgRails::Api::Soccer::Requester

    def initialize(provider: '')
      @data = :countries
      super provider
    end

  end
end