BetfairApiNgRails.config do |config|
  require 'yaml'

  load_config = YAML.load_file("#{Rails.root}/config/betfair_api_ng_rails.yml")[Rails.env]

  config.application_key  = load_config['application_key']
  config.ssl_key_filepath = "#{Rails.root}/public/client-2048.key"
  config.ssl_crt_filepath = "#{Rails.root}/public/client-2048.crt"
  config.login_url        = load_config['login_url']
  config.api_url          = load_config['api_url']
  config.username         = load_config['username']
  config.password         = load_config['password']

  # Uncomment and set needed formatter or nil if you want plain response
  # config.formatter        = :js_tree

end