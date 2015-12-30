require "betfair_api_ng_rails/version"
require "betfair_api_ng_rails/errors"
require "betfair_api_ng_rails/api/request_methods/all"
require "betfair_api_ng_rails/railtie" if defined?(Rails)
require 'redis'
require 'active_support/dependencies/autoload'

module BetfairApiNgRails
  extend ActiveSupport::Autoload

  autoload :Account
  autoload :AccountSession
  autoload :AccountManager
  autoload :AccountSessionManager
  autoload :BadResponseError

  module Api
    extend ActiveSupport::Autoload

    autoload :BaseProvider
    autoload :BaseRequester
    autoload :FormatterFactory

    autoload :Config
    autoload :Constants
    autoload :Provider
    autoload :SessionManager

    autoload :Connection
    autoload :Hashalator

    autoload :RequestMethod

    module Caching
      extend ActiveSupport::Autoload

      autoload :Helper
      autoload :ResponseCache
    end

    module Logs
      extend ActiveSupport::Autoload

      autoload :FileLogger
      autoload :ConsoleLogger
    end

    module Formatters
      extend ActiveSupport::Autoload

      autoload :JsTreeFormatter
    end

    module Data
      extend ActiveSupport::Autoload

      autoload :Base
      autoload :Constants
      autoload :Competition
      autoload :CompetitionResult
      autoload :MarketFilter
      autoload :TimeRange
      autoload :TimeRangeResult
      autoload :EventType
      autoload :EventTypeResult
      autoload :Event
      autoload :EventResult
      autoload :CountryCodeResult
      autoload :VenueResult
      autoload :MarketTypeResult
      autoload :MarketCatalogue
      autoload :MarketDescription
      autoload :RunnerCatalog
      autoload :MarketBook
      autoload :Runner
      autoload :Order
      autoload :Match
      autoload :StartingPrices
      autoload :ExchangePrices
      autoload :PriceSize
      autoload :PriceProjection
      autoload :ExBestOffersOverrides
      autoload :PlaceExecutionReport
      autoload :PlaceInstructionReport
      autoload :PlaceInstruction
      autoload :LimitOrder
      autoload :LimitOnCloseOrder
      autoload :MarketOnCloseOrder
      autoload :AccountDetailsResponse
      autoload :AccountFundsResponse
      autoload :StatementLegacyData
      autoload :StatementItem
      autoload :AccountStatementReport

      module Concerns
        extend ActiveSupport::Autoload

        autoload :Hashable
        autoload :Attributable
        autoload :Jsonable
      end
    end

    module Enums
      extend ActiveSupport::Autoload

      autoload :MarketProjection
      autoload :PriceData
      autoload :MatchProjection
      autoload :OrderProjection
      autoload :MarketStatus
      autoload :RunnerStatus
      autoload :TimeGranularity
      autoload :Side
      autoload :OrderStatus
      autoload :OrderBy
      autoload :SortDir
      autoload :OrderType
      autoload :MarketSort
      autoload :MarketBettingType
      autoload :ExecutionReportStatus
      autoload :ExecutionReportErrorCode
      autoload :PersistenceType
      autoload :InstrictionReportStatus
      autoload :InstructionReportErrorCode
      autoload :RollupModel
      autoload :GroupBy
      autoload :BetStatus
      autoload :IncludeItem
      autoload :Wallet
      autoload :ItemClass

      module Concerns
        extend ActiveSupport::Autoload

        autoload :Enumable
      end
    end

    module Http
      extend ActiveSupport::Autoload

      autoload :Requester
      autoload :Responser
      autoload :Factory
      autoload :ProxyRequester
    end

    module Parsers
      extend ActiveSupport::Autoload

      autoload :Base
      autoload :ListBase
      autoload :SingleBase
      autoload :ListCompetitions
      autoload :ListEventTypes
      autoload :ListEvents
      autoload :ListTimeRanges
      autoload :ListCountries
      autoload :ListVenues
      autoload :ListMarketTypes
      autoload :ListMarketCatalogue
      autoload :ListMarketBook
      autoload :PlaceOrders
      autoload :GetAccountDetails
      autoload :GetAccountFunds
      autoload :GetAccountStatement
    end

    module ConnectionExt
      extend ActiveSupport::Autoload

      autoload :ErrorHandling
      autoload :SsoidRefreshing
      autoload :Parsing
      autoload :Formatting
      autoload :Logging
      autoload :Caching
    end

    module Endpoints
      extend ActiveSupport::Autoload

      autoload :Base
      autoload :Uk
      autoload :Australian
      autoload :Italian
      autoload :Spanish
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

  def self.account_manager
    BetfairApiNgRails::AccountManager.instance
  end

  def self.account_session_manager
    BetfairApiNgRails::AccountSessionManager.instance
  end
end
