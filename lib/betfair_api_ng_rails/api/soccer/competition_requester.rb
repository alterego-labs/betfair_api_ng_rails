module BetfairApiNgRails
  class Api::Soccer::CompetitionRequester < BetfairApiNgRails::Api::Soccer::Requester

    def initialize(provider: '')
      @data = :competition
      super provider
    end

    def load(parameters: {})
      make_fetch parameters: parameters
    end

  end
end