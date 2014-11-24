require "betfair_api_ng_rails/version"
require "betfair_api_ng_rails/errors"
require "betfair_api_ng_rails/api/request_methods/all"
require "betfair_api_ng_rails/railtie" if defined?(Rails)
require 'redis'

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
    autoload :Hashalator,         'betfair_api_ng_rails/api/hashalator'

    module Caching
      autoload :Helper,         'betfair_api_ng_rails/api/caching/helper'
      autoload :ResponseCache,  'betfair_api_ng_rails/api/caching/response_cache'
    end

    module Logs
      autoload :FileLogger,         'betfair_api_ng_rails/api/logs/file_logger'
      autoload :ConsoleLogger,      'betfair_api_ng_rails/api/logs/console_logger'
    end

    module Formatters
      autoload :JsTreeFormatter, 'betfair_api_ng_rails/api/formatters/js_tree_formatter'
    end

    module Data
      autoload :Base,                  'betfair_api_ng_rails/api/data/base'
      autoload :Constants,             'betfair_api_ng_rails/api/data/constants'
      autoload :Competition,           'betfair_api_ng_rails/api/data/competition'
      autoload :CompetitionResult,     'betfair_api_ng_rails/api/data/competition_result'
      autoload :MarketFilter,          'betfair_api_ng_rails/api/data/market_filter'
      autoload :TimeRange,             'betfair_api_ng_rails/api/data/time_range'
      autoload :TimeRangeResult,       'betfair_api_ng_rails/api/data/time_range_result'
      autoload :EventType,             'betfair_api_ng_rails/api/data/event_type'
      autoload :EventTypeResult,       'betfair_api_ng_rails/api/data/event_type_result'
      autoload :Event,                 'betfair_api_ng_rails/api/data/event'
      autoload :EventResult,           'betfair_api_ng_rails/api/data/event_result'
      autoload :CountryCodeResult,     'betfair_api_ng_rails/api/data/country_code_result'
      autoload :VenueResult,           'betfair_api_ng_rails/api/data/venue_result'
      autoload :MarketTypeResult,      'betfair_api_ng_rails/api/data/market_type_result'
      autoload :MarketCatalogue,       'betfair_api_ng_rails/api/data/market_catalogue'
      autoload :MarketDescription,     'betfair_api_ng_rails/api/data/market_description'
      autoload :RunnerCatalog,         'betfair_api_ng_rails/api/data/runner_catalog'
      autoload :MarketBook,            'betfair_api_ng_rails/api/data/market_book'
      autoload :Runner,                'betfair_api_ng_rails/api/data/runner'
      autoload :Order,                 'betfair_api_ng_rails/api/data/order'
      autoload :Match,                 'betfair_api_ng_rails/api/data/match'
      autoload :StartingPrices,        'betfair_api_ng_rails/api/data/starting_prices'
      autoload :ExchangePrices,        'betfair_api_ng_rails/api/data/exchange_prices'
      autoload :PriceSize,             'betfair_api_ng_rails/api/data/price_size'
      autoload :PriceProjection,       'betfair_api_ng_rails/api/data/price_projection'
      autoload :ExBestOffersOverrides, 'betfair_api_ng_rails/api/data/ex_best_offers_overrides'
      autoload :PlaceExecutionReport,  'betfair_api_ng_rails/api/data/place_execution_report'
      autoload :PlaceInstructionReport,'betfair_api_ng_rails/api/data/place_instruction_report'
      autoload :PlaceInstruction,      'betfair_api_ng_rails/api/data/place_instruction'
      autoload :LimitOrder,            'betfair_api_ng_rails/api/data/limit_order'
      autoload :LimitOnCloseOrder,     'betfair_api_ng_rails/api/data/limit_on_close_order'
      autoload :MarketOnCloseOrder,    'betfair_api_ng_rails/api/data/market_on_close_order'

      module Concerns
        autoload :Hashable,           'betfair_api_ng_rails/api/data/concerns/hashable'
        autoload :Attributable,       'betfair_api_ng_rails/api/data/concerns/attributable'
        autoload :Jsonable,           'betfair_api_ng_rails/api/data/concerns/jsonable'
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
      autoload :Requester,      'betfair_api_ng_rails/api/http/requester'
      autoload :Responser,      'betfair_api_ng_rails/api/http/responser'
      autoload :Factory,        'betfair_api_ng_rails/api/http/factory'
      autoload :ProxyRequester, 'betfair_api_ng_rails/api/http/proxy_requester'
    end

    module Parsers
      autoload :Base,                'betfair_api_ng_rails/api/parsers/base'
      autoload :ListBase,            'betfair_api_ng_rails/api/parsers/list_base'
      autoload :SingleBase,          'betfair_api_ng_rails/api/parsers/single_base'
      autoload :ListCompetitions,    'betfair_api_ng_rails/api/parsers/list_competitions'
      autoload :ListEventTypes,      'betfair_api_ng_rails/api/parsers/list_event_types'
      autoload :ListEvents,          'betfair_api_ng_rails/api/parsers/list_events'
      autoload :ListTimeRanges,      'betfair_api_ng_rails/api/parsers/list_time_ranges'
      autoload :ListCountries,       'betfair_api_ng_rails/api/parsers/list_countries'
      autoload :ListVenues,          'betfair_api_ng_rails/api/parsers/list_venues'
      autoload :ListMarketTypes,     'betfair_api_ng_rails/api/parsers/list_market_types'
      autoload :ListMarketCatalogue, 'betfair_api_ng_rails/api/parsers/list_market_catalogue'
      autoload :ListMarketBook,      'betfair_api_ng_rails/api/parsers/list_market_book'
      autoload :PlaceOrders,         'betfair_api_ng_rails/api/parsers/place_orders'
    end

    module ConnectionExt
      autoload :ErrorHandling,   'betfair_api_ng_rails/api/connection_ext/error_handling'
      autoload :SsoidRefreshing, 'betfair_api_ng_rails/api/connection_ext/ssoid_refreshing'
      autoload :Parsing,         'betfair_api_ng_rails/api/connection_ext/parsing'
      autoload :Formatting,      'betfair_api_ng_rails/api/connection_ext/formatting'
      autoload :Logging,         'betfair_api_ng_rails/api/connection_ext/logging'
      autoload :Caching,         'betfair_api_ng_rails/api/connection_ext/caching'
    end
  end

  include Api::Data
  extend  Api::RequestMethods::All

  class << self
    attr_accessor :log
  end

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
