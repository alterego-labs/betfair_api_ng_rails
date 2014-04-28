BetfairApiNgRails.config do |config|
  
  config.load_for_environment "#{Rails.root}/config/betfair_api_ng_rails.yml", Rails.env

  config.ssl_key_filepath   = "#{Rails.root}/public/client-2048.key"
  config.ssl_crt_filepath   = "#{Rails.root}/public/client-2048.crt"
  
  config.locale             = :ru
  config.formatter          = nil
  config.keep_alive_session = true

end