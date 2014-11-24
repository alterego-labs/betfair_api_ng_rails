module BetfairApiNgRails
  module Api
    class Config
      class << self
        attr_accessor :application_key,
                      :ssl_key_filepath,
                      :ssl_crt_filepath,
                      :username,
                      :password,
                      :locale,
                      :formatter,
                      :keep_alive_session,
                      :use_cache,
                      :cache_expire,
                      :proxy_url,
                      :proxy_enable,
                      :go_localuser,
                      :go_filename

        def formatter=(value)
          @formatter = Api::FormatterFactory.initialize_formatter value
        end

        def load_for_environment(file_path, env)
          require 'yaml'
          load_config = YAML.load_file(file_path)[env]
          Api::Constants::LOADABLE_CONFIG_OPTIONS.each do |opt|
            send("#{opt}=", load_config[opt.to_s])
          end
        end
      end
    end
  end
end
