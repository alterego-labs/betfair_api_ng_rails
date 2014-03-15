module BetfairApiNgRails
  class Api::Soccer::TimeRangeRequester < BetfairApiNgRails::Api::Soccer::Requester

    def initialize(provider: '')
      @data = :time_ranges
      super provider
    end

  end
end