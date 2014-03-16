require 'active_support/core_ext/object'
require 'betfair_api_ng_rails/api/bf/formatters/js_tree_formatter'

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
                        :formatter

          def formatter=(value)
            @formatter = initialize_formatter value
          end

        private

          def initialize_formatter(name)
            name.is_a?(Symbol) ? initialize_formatter_by(name: name) : name.try(:new)
          end

          def initialize_formatter_by(name: "")
            "BetfairApiNgRails::Api::BF::Formatters::#{name.to_s.camelize}Formatter".constantize.new
          end

        end

      end
    end
  end
end