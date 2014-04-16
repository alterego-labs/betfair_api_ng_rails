require "betfair_api_ng_rails/version"
require "betfair_api_ng_rails/errors"
require "betfair_api_ng_rails/api/request_methods"
require "betfair_api_ng_rails/railtie" if defined?(Rails)

module BetfairApiNgRails

  module Api

    autoload :BaseProvider,     'betfair_api_ng_rails/api/base_provider'
    autoload :BaseRequester,    'betfair_api_ng_rails/api/base_requester'
    autoload :FormatterFactory, 'betfair_api_ng_rails/api/formatter_factory'

    autoload :Config,         'betfair_api_ng_rails/api/config'
    autoload :Constants,      'betfair_api_ng_rails/api/constants'
    autoload :Provider,       'betfair_api_ng_rails/api/provider'
    autoload :SessionManager, 'betfair_api_ng_rails/api/session_manager'

    autoload :Connection,         'betfair_api_ng_rails/api/connection'

    module Formatters

      autoload :JsTreeFormatter, 'betfair_api_ng_rails/api/formatters/js_tree_formatter'

    end

    module Data

      autoload :Base,               'betfair_api_ng_rails/api/data/base'
      autoload :Attributes,         'betfair_api_ng_rails/api/data/attributes'
      autoload :Constants,          'betfair_api_ng_rails/api/data/constants'
      autoload :Competition,        'betfair_api_ng_rails/api/data/competition'
      autoload :CompetitionResult,  'betfair_api_ng_rails/api/data/competition_result'
      autoload :MarketFilter,       'betfair_api_ng_rails/api/data/market_filter'
      autoload :TimeRange,          'betfair_api_ng_rails/api/data/time_range'
      autoload :TimeRangeResult,    'betfair_api_ng_rails/api/data/time_range_result'
      autoload :EventType,          'betfair_api_ng_rails/api/data/event_type'
      autoload :EventTypeResult,    'betfair_api_ng_rails/api/data/event_type_result'
      autoload :Event,              'betfair_api_ng_rails/api/data/event'
      autoload :EventResult,        'betfair_api_ng_rails/api/data/event_result'

      module Concerns

        autoload :Hashable,           'betfair_api_ng_rails/api/data/concerns/hashable'
        autoload :Querable,           'betfair_api_ng_rails/api/data/concerns/querable'

      end

    end

    module Enums

      autoload :MarketProjection,           'betfair_api_ng_rails/api/enums/market_projection'
      autoload :PriceData,                  'betfair_api_ng_rails/api/enums/price_data'
      autoload :MatchProjection,            'betfair_api_ng_rails/api/enums/match_projection'
      autoload :OrderProjection,            'betfair_api_ng_rails/api/enums/order_projection'
      autoload :MarketStatus,               'betfair_api_ng_rails/api/enums/market_status'
      autoload :RunnerStatus,               'betfair_api_ng_rails/api/enums/runner_status'
      autoload :TimeGranularity,            'betfair_api_ng_rails/api/enums/time_granularity'
      autoload :Side,                       'betfair_api_ng_rails/api/enums/side'
      autoload :OrderStatus,                'betfair_api_ng_rails/api/enums/order_status'
      autoload :OrderBy,                    'betfair_api_ng_rails/api/enums/order_by'
      autoload :SortDir,                    'betfair_api_ng_rails/api/enums/sort_dir'
      autoload :OrderType,                  'betfair_api_ng_rails/api/enums/order_type'
      autoload :MarketSort,                 'betfair_api_ng_rails/api/enums/market_sort'
      autoload :MarketBettingType,          'betfair_api_ng_rails/api/enums/market_betting_type'
      autoload :ExecutionReportStatus,      'betfair_api_ng_rails/api/enums/execution_report_status'
      autoload :ExecutionReportErrorCode,   'betfair_api_ng_rails/api/enums/execution_report_error_code'
      autoload :PersistenceType,            'betfair_api_ng_rails/api/enums/perisstence_type'
      autoload :InstrictionReportStatus,    'betfair_api_ng_rails/api/enums/instruction_report_status'
      autoload :InstructionReportErrorCode, 'betfair_api_ng_rails/api/enums/instruction_report_error_code'
      autoload :RollupModel,                'betfair_api_ng_rails/api/enums/rollup_model'
      autoload :GroupBy,                    'betfair_api_ng_rails/api/enums/group_by'
      autoload :BetStatus,                  'betfair_api_ng_rails/api/enums/bet_status'

      module Concerns

        autoload :Enumable, 'betfair_api_ng_rails/api/enums/concerns/enumable'

      end

    end

    module Http

      autoload :Requester,  'betfair_api_ng_rails/api/http/requester'
      autoload :Responser,  'betfair_api_ng_rails/api/http/responser'
      autoload :Factory,    'betfair_api_ng_rails/api/http/factory'

    end

    module Parsers

      autoload :Base,             'betfair_api_ng_rails/api/orm/parsers/base'
      autoload :ListCompetitions, 'betfair_api_ng_rails/api/orm/parsers/list_competitions'
      autoload :ListEventTypes,   'betfair_api_ng_rails/api/orm/parsers/list_event_types'
      autoload :ListEvents,       'betfair_api_ng_rails/api/orm/parsers/list_events'

    end

  end

  include Api::Data
  extend  Api::RequestMethods

  def self.config(&block)
    @_config ||= BetfairApiNgRails::Api::Config
    block_given? ? yield(@_config) : @_config
  end

  def self.connection
    raise BetfairApiNgRails::NoConnectionError unless @connection
    @connection
  end

  def self.connection=(value)
    @connection = value
  end

end
