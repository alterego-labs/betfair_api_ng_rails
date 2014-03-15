module BetfairApiNgRails
  class Api::Soccer::CompetitionRequester < BetfairApiNgRails::Api::Soccer::Requester

    def initialize(provider: '')
      @data = :competitions
      super provider
    end

  end
end