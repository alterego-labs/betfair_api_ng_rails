module BetfairApiNgRails
  class Api::Soccer::CurrentOrderRequester < BetfairApiNgRails::Api::Soccer::Requester

    def initialize(provider: '')
      @data = :current_orders
      super provider
    end

  end
end