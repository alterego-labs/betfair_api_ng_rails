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
        :login_url,
        :api_url,
        :keep_alive_url,
        :username,
        :password,
        :go_localuser,
        :go_filename
      ]

    end
  end
end