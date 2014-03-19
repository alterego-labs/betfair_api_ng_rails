require "betfair_api_ng_rails/version"

module BetfairApiNgRails

  module Api

    autoload :BaseParser,       'betfair_api_ng_rails/api/base_parser'
    autoload :BaseProvider,     'betfair_api_ng_rails/api/base_provider'
    autoload :BaseRequester,    'betfair_api_ng_rails/api/base_requester'
    autoload :BaseFormatter,    'betfair_api_ng_rails/api/base_formatter'

    module BF

      autoload :Config,         'betfair_api_ng_rails/api/bf/config'
      autoload :Constants,      'betfair_api_ng_rails/api/bf/constants'
      autoload :Provider,       'betfair_api_ng_rails/api/bf/provider'
      autoload :Parser,         'betfair_api_ng_rails/api/bf/parser'
      autoload :SessionManager, 'betfair_api_ng_rails/api/bf/session_manager'

      module Http

        autoload :Requester,  'betfair_api_ng_rails/api/bf/http/requester'
        autoload :Responser,  'betfair_api_ng_rails/api/bf/http/responser'
        autoload :Factory,    'betfair_api_ng_rails/api/bf/http/factory'

      end

    end

    module Soccer

      autoload :Requester, 'betfair_api_ng_rails/api/soccer/requester'

    end

  end

  def self.config(&block)
    @_config ||= BetfairApiNgRails::Api::BF::Config
    block_given? ? yield(@_config) : @_config
  end

end
