module BetfairApiNgRails
  class Api::Soccer::TimeRangeRequester < BetfairApiNgRails::Api::Soccer::Requester

    def initialize(provider: '')
      @data = :time_range
      super provider
    end

  end
end