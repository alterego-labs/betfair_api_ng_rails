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
                      :keep_alive_url

        def formatter=(value)
          @formatter = BetfairApiNgRails::Api::FormatterFactory.initialize_formatter value
        end

      end

    end
  end
end