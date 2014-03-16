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

      end
    end
  end
end