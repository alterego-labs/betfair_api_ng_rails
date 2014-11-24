module BetfairApiNgRails
  module Api
    module RequestMethods
      module Account
        #
        # Returns the details relating your account, including your discount rate and Betfair point balance.
        #
        def get_account_details
        end

        #
        # Get available to bet amount. The getAccounts service will return the UK wallet balance by default
        # from either the UK or AUS Accounts API endpoint if the wallet parameter is not specified.
        #
        def get_account_funds
        end
      end
    end
  end
end


