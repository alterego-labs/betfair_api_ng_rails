module BetfairApiNgRails
  module Api
    module BF
      module Constants

        SUCCESS_LOGIN = "SUCCESS"

        PROVIDER_NAME = "BF"

        SESSION_REQUEST_HEADERS = {
          "Content-Type" => "application/x-www-form-urlencoded"
        }

        API_REQUEST_HEADERS = {
          "Content-Type" => "application/json",
          "Accept"       => "application/json"
        }

        ALLOWED_RESOURCES = {
          soccer: [:event_types, :competitions, :time_ranges, :events, :market_types, :countries, :venues, :market_catalogue,
                   :market_book, :current_orders, :cleared_orders, :market_profit_and_loss]
        }

      end
    end
  end
end