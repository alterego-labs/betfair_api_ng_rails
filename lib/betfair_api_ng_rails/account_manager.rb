require 'singleton'

module BetfairApiNgRails
  class AccountManager
    include Singleton

    attr_reader :accounts
    attr_reader :default_account

    def initialize
      clear
    end

    def store(account)
      accounts[account.username] = account
    end

    def get(username)
      accounts.fetch username, fetch_default_account
    end

    def default(username)
      @default_account = username
    end

    def clear
      @accounts = {}
    end

    private

    def fetch_default_account
      accounts.fetch default_account, nil
    end
  end
end
