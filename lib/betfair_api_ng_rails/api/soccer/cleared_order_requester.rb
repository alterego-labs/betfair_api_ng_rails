module BetfairApiNgRails
  class Api::Soccer::ClearedOrderRequester < BetfairApiNgRails::Api::Soccer::Requester

    def initialize(provider: '')
      @data = :cleared_orders
      super provider
    end

  end
end