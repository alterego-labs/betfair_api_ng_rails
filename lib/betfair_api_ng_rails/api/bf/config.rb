module BetfairApiNgRails
  module Api
    module BF
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
                        :formatter

          def formatter=(value)
            @formatter = BetfairApiNgRails::Api::FormatterFactory.initialize_formatter value
          end

        end

      end
    end
  end
end