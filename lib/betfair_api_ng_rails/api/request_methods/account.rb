module BetfairApiNgRails
  module Api
    module RequestMethods
      module Account
        #
        # Returns the details relating your account, including your discount rate and Betfair point balance.
        #
        def get_account_details(account: '')
          run_request __method__, {}, account
        end

        #
        # Get available to bet amount. The getAccounts service will return the UK wallet balance by default
        # from either the UK or AUS Accounts API endpoint if the wallet parameter is not specified.
        #
        def get_account_funds(account: '')
          run_request __method__, {}, account
        end

        #
        # Get account statement
        #
        # Parameters:
        # locale - The language to be used where applicable. If not specified, the customer account default is returned.
        # from_record - Specifies the first record that will be returned. Records start at index zero.
        #               If not specified then it will default to 0.
        # record_count - Specifies the maximum number of records to be returned.
        #                Note that there is a page size limit of 100.
        # item_date_range - Return items with an itemDate within this date range. Both from and to date times are inclusive.
        #                   If from is not specified then the oldest available items will be in range. If to is not specified
        #                   then the latest items will be in range. nb. This itemDataRange is currently only applied when
        #                   includeItem is set to ALL or not specified, else items are NOT bound by itemDate.
        # include_item - Which items to include, if not specified then defaults to ALL.
        # wallet - Which wallet to return statementItems for. If unspecified then the UK wallet will be selected
        # account - account username
        #
        # Returns:
        # List of statement items chronologically ordered plus moreAvailable boolean to facilitate paging
        #
        def get_account_statement(args)
          raise 'Must be a hash passed!' unless args.is_a? Hash
          args[:locale] = args[:locale] || BetfairApiNgRails.config.locale
          account = args[:account]
          run_request __method__, args.except(:account), account
        end
      end
    end
  end
end


