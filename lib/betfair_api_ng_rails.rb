require "betfair_api_ng_rails/version"

module BetfairApiNgRails

  module Api
    module BF

      autoload :Config, 'betfair_api_ng_rails/api/bf/config'

    end
  end

  def self.config(&block)
    @_config ||= BetfairApiNgRails::Api::BF::Config
    block_given? ? yield(@_config) : @_config
  end

end
