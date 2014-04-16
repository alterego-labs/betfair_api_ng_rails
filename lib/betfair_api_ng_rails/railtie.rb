module BetfairApiNgRails
  class Railtie < Rails::Railtie
    config.after_initialize do
      BetfairApiNgRails.connection = BetfairApiNgRails::Api::Connection.new
    end
  end
end