module BetfairApiNgRails
  module Api
    module Constants
      SUCCESS_LOGIN = "SUCCESS"

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
        "listMarketProfitAndLoss",
        "placeOrders"
      ]

      ALLOWED_FORMATTING = [
        "listEventTypes",
        "listCompetitions",
        "listEvents"
      ]

      SIMPLE_LISTING_FILTERED = [
        "listEventTypes",
        "listCompetitions",
        "listTimeRanges",
        "listEvents",
        "listMarketTypes",
        "listCountries",
        "listVenues"
      ]

      LOADABLE_CONFIG_OPTIONS = [
        :application_key,
        :api_url,
        :username,
        :password,
        :go_localuser,
        :go_filename
      ]

      # URLs

      LOGIN_URL = "https://identitysso.betfair.com/api/certlogin"

      KEEP_ALIVE_URL = "https://identitysso.betfair.com/api/keepAlive"
    end
  end
end
