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

        autoload :Base,               'betfair_api_ng_rails/api/bf/data/base'
        autoload :Attributes,         'betfair_api_ng_rails/api/bf/data/attributes'
        autoload :Constants,          'betfair_api_ng_rails/api/bf/data/constants'
        autoload :Competition,        'betfair_api_ng_rails/api/bf/data/competition'
        autoload :CompetitionResult,  'betfair_api_ng_rails/api/bf/data/competition_result'
        autoload :MarketFilter,       'betfair_api_ng_rails/api/bf/data/market_filter'
        autoload :TimeRange,          'betfair_api_ng_rails/api/bf/data/time_range'
        autoload :TimeRangeResult,    'betfair_api_ng_rails/api/bf/data/time_range_result'
        autoload :EventType,          'betfair_api_ng_rails/api/bf/data/event_type'
        autoload :EventTypeResult,    'betfair_api_ng_rails/api/bf/data/event_type_result'
        autoload :Event,              'betfair_api_ng_rails/api/bf/data/event'
        autoload :EventResult,        'betfair_api_ng_rails/api/bf/data/event_result'

        module Concerns

          autoload :Hashable,           'betfair_api_ng_rails/api/bf/data/concerns/hashable'
          autoload :Querable,           'betfair_api_ng_rails/api/bf/data/concerns/querable'

        end

      end

      module Enums

        autoload :MarketProjection,           'betfair_api_ng_rails/api/bf/enums/market_projection'
        autoload :PriceData,                  'betfair_api_ng_rails/api/bf/enums/price_data'
        autoload :MatchProjection,            'betfair_api_ng_rails/api/bf/enums/match_projection'
        autoload :OrderProjection,            'betfair_api_ng_rails/api/bf/enums/order_projection'
        autoload :MarketStatus,               'betfair_api_ng_rails/api/bf/enums/market_status'
        autoload :RunnerStatus,               'betfair_api_ng_rails/api/bf/enums/runner_status'
        autoload :TimeGranularity,            'betfair_api_ng_rails/api/bf/enums/time_granularity'
        autoload :Side,                       'betfair_api_ng_rails/api/bf/enums/side'
        autoload :OrderStatus,                'betfair_api_ng_rails/api/bf/enums/order_status'
        autoload :OrderBy,                    'betfair_api_ng_rails/api/bf/enums/order_by'
        autoload :SortDir,                    'betfair_api_ng_rails/api/bf/enums/sort_dir'
        autoload :OrderType,                  'betfair_api_ng_rails/api/bf/enums/order_type'
        autoload :MarketSort,                 'betfair_api_ng_rails/api/bf/enums/market_sort'
        autoload :MarketBettingType,          'betfair_api_ng_rails/api/bf/enums/market_betting_type'
        autoload :ExecutionReportStatus,      'betfair_api_ng_rails/api/bf/enums/execution_report_status'
        autoload :ExecutionReportErrorCode,   'betfair_api_ng_rails/api/bf/enums/execution_report_error_code'
        autoload :PersistenceType,            'betfair_api_ng_rails/api/bf/enums/perisstence_type'
        autoload :InstrictionReportStatus,    'betfair_api_ng_rails/api/bf/enums/instruction_report_status'
        autoload :InstructionReportErrorCode, 'betfair_api_ng_rails/api/bf/enums/instruction_report_error_code'
        autoload :RollupModel,                'betfair_api_ng_rails/api/bf/enums/rollup_model'
        autoload :GroupBy,                    'betfair_api_ng_rails/api/bf/enums/group_by'
        autoload :BetStatus,                  'betfair_api_ng_rails/api/bf/enums/bet_status'

        module Concerns

          autoload :Enumable, 'betfair_api_ng_rails/api/bf/enums/concerns/enumable'

        end

      end

      module Http

        autoload :Requester,  'betfair_api_ng_rails/api/bf/http/requester'
        autoload :Responser,  'betfair_api_ng_rails/api/bf/http/responser'
        autoload :Factory,    'betfair_api_ng_rails/api/bf/http/factory'

      end

      module ORM

        autoload :Requester, 'betfair_api_ng_rails/api/bf/orm/requester'

        module Parsers

          autoload :Base,             'betfair_api_ng_rails/api/bf/orm/parsers/base'
          autoload :ListCompetitions, 'betfair_api_ng_rails/api/bf/orm/parsers/list_competitions'
          autoload :ListEventTypes,   'betfair_api_ng_rails/api/bf/orm/parsers/list_event_types'
          autoload :ListEvents,       'betfair_api_ng_rails/api/bf/orm/parsers/list_events'

        end

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
