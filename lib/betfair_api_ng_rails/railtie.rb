module BetfairApiNgRails
  class Railtie < Rails::Railtie
    config.after_initialize do
      BetfairApiNgRails.connection = BetfairApiNgRails::Connection.new BetfairApiNgRails.config 
    end
  end
end