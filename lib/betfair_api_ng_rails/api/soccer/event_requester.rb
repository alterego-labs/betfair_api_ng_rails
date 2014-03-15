module BetfairApiNgRails
  class Api::Soccer::EventRequester < BetfairApiNgRails::Api::Soccer::Requester

    def initialize(provider: '')
      @data = :event
      super provider
    end

  end
end