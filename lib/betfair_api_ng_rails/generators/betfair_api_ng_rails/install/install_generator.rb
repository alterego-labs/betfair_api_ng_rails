require 'rails/generators/base'

module BetfairApiNgRails
  module Generators
    class InstallGenerator < ::Rails::Generators::Base
      source_root File.expand_path("../templates", __FILE__)

      def create_configuration_file
        copy_file 'betfair_api_ng_rails.yml', File.join('config', "betfair_api_ng_rails.yml")
      end

      def create_initializer_file
        copy_file 'betfair_api_ng_rails.rb', File.join('config/initializers', "betfair_api_ng_rails.rb")
      end

    end
  end
end