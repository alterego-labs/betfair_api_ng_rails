require "betfair_api_ng_rails/version"

module BetfairApiNgRails

  module Api

    autoload :BaseProvider,     'betfair_api_ng_rails/api/base_provider'
    autoload :BaseRequester,    'betfair_api_ng_rails/api/base_requester'

    module BF

      autoload :Config,         'betfair_api_ng_rails/api/bf/config'
      autoload :Constants,      'betfair_api_ng_rails/api/bf/constants'
      autoload :Provider,       'betfair_api_ng_rails/api/bf/provider'
      autoload :SessionManager, 'betfair_api_ng_rails/api/bf/session_manager'

      module Data

        autoload :Competition,        'betfair_api_ng_rails/api/bf/data/competition'
        autoload :CompetitionResult,  'betfair_api_ng_rails/api/bf/data/competition_result'
        autoload :MarketFilter,       'betfair_api_ng_rails/api/bf/data/market_filter'
        autoload :TimeRange,          'betfair_api_ng_rails/api/bf/data/time_range'
        autoload :TimeRangeResult,    'betfair_api_ng_rails/api/bf/data/time_range_result'

      end

      module Http

        autoload :Requester,  'betfair_api_ng_rails/api/bf/http/requester'
        autoload :Responser,  'betfair_api_ng_rails/api/bf/http/responser'
        autoload :Factory,    'betfair_api_ng_rails/api/bf/http/factory'

      end

      module ORM

        autoload :Requester, 'betfair_api_ng_rails/api/bf/orm/requester'

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
