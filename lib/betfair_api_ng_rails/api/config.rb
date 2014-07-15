module BetfairApiNgRails
  module Api
    class Config

      class << self

        attr_accessor :application_key,
                      :ssl_key_filepath,
                      :ssl_crt_filepath,
                      :login_url,
                      :api_url,
                      :username,
                      :password,
                      :locale,
                      :formatter,
                      :keep_alive_session,
                      :keep_alive_url,
                      :use_cache,
                      :cache_expire,
                      :go_url,
                      :go_enable
                      :go_localuser,
                      :go_filename

        def formatter=(value)
          @formatter = BetfairApiNgRails::Api::FormatterFactory.initialize_formatter value
        end

        def load_for_environment(file_path, env)
          require 'yaml'
          load_config = YAML.load_file(file_path)[env]
          Api::Constants::LOADABLE_CONFIG_OPTIONS.each { |opt| self.send("#{opt}=", load_config[opt.to_s]) }
        end

      end

    end
  end
end