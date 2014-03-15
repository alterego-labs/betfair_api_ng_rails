module BetfairApiNgRails
  class Api::Soccer::EventTypeRequester < BetfairApiNgRails::Api::Soccer::Requester

    def initialize(provider: '')
      @data = :event_types
      super provider
    end

  end
end