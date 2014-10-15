BetfairApiNgRails.config do |config|  
  config.load_for_environment "#{Rails.root}/config/betfair_api_ng_rails.yml", Rails.env

  config.ssl_key_filepath   = "#{Rails.root}/public/client-2048.key"
  config.ssl_crt_filepath   = "#{Rails.root}/public/client-2048.crt"
  
  config.locale             = :ru
  config.formatter          = nil
  config.keep_alive_session = true

  # Caching settings
  config.use_cache          = false
  config.cache_expire       = 5     # in seconds

  # Proxy layer settings
  config.proxy_enable       = false
  # Uncomment next line if you will use go layer and go_enable is set to true
  # config.proxy_url          = "http://127.0.0.1/"
end
