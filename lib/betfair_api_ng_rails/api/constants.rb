module BetfairApiNgRails
  module Api
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

      ALLOWED_RESOURCES = [
        "listEventTypes",
        "listCompetitions",
        "listTimeRanges",
        "listEvents",
        "listMarketTypes",
        "listCountries",
        "listVenues",
        "listMarketCatalogue",
        "listMarketBook",
        "listCurrentOrders",
        "listClearedOrders",
        "listMarketProfitAndLoss"
      ]

    end
  end
end