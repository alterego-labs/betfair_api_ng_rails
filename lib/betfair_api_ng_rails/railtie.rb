module BetfairApiNgRails
  class Railtie < Rails::Railtie
    config.after_initialize do
      BetfairApiNgRails.log        = BetfairApiNgRails::Api::Logs::FileLogger.new Rails.root, Rails.env
    end

    console do
      BetfairApiNgRails.log        = BetfairApiNgRails::Api::Logs::ConsoleLogger.new
    end

  end
end
