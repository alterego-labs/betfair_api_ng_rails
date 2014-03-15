module BetfairApiNgRails
  class Api::Soccer::VenueRequester < BetfairApiNgRails::Api::Soccer::Requester

    def initialize(provider: '')
      @data = :venue
      super provider
    end

  end
end