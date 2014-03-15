module BetfairApiNgRails
  class Api::Soccer::MarketProfitAndLossRequester < BetfairApiNgRails::Api::Soccer::Requester

    def initialize(provider: '')
      @data = :market_profit_and_loss
      super provider
    end

  end
end