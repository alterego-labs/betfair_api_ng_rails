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

      ALLOWED_RESOURCES = {
        betting:[
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
        ],
        account:[
          "getAccountDetails",
          "getAccountFunds",
          "getAccountStatement"
        ]
      }

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
        :username,
        :password,
        :go_localuser,
        :go_filename
      ]

      JSON_METHOD = {
        betting: 'SportsAPING',
        account: 'AccountAPING'
      }

      # URLs

      LOGIN_URL = "https://identitysso.betfair.com/api/certlogin"

      KEEP_ALIVE_URL = "https://identitysso.betfair.com/api/keepAlive"
    end
  end
end
