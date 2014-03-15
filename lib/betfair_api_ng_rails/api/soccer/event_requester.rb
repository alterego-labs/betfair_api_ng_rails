module BetfairApiNgRails
  class Api::Soccer::EventRequester < BetfairApiNgRails::Api::Soccer::Requester

    def initialize(provider: '')
      @data = :events
      super provider
    end

  end
end