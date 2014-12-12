module BetfairApiNgRails
  class Railtie < Rails::Railtie
    config.after_initialize do
      BetfairApiNgRails.connection = BetfairApiNgRails::Api::Connection.new
      BetfairApiNgRails.log        = BetfairApiNgRails::Api::Logs::FileLogger.new Rails.root, Rails.env
      BetfairApiNgRails.account_manager         = BetfairApiNgRails::AccountManager.instance
      BetfairApiNgRails.account_session_manager = BetfairApiNgRails::AccountSessionManager.instance
    end

    console do
      BetfairApiNgRails.log        = BetfairApiNgRails::Api::Logs::ConsoleLogger.new
    end

  end
end
