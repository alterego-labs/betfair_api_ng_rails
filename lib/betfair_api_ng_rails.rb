require "betfair_api_ng_rails/version"

module BetfairApiNgRails

  module Api

    autoload :BaseParser,    'betfair_api_ng_rails/api/base_parser'
    autoload :BaseProvider,  'betfair_api_ng_rails/api/base_provider'
    autoload :BaseRequester, 'betfair_api_ng_rails/api/base_requester'

    module BF

      autoload :Config,         'betfair_api_ng_rails/api/bf/config'
      autoload :Constants,      'betfair_api_ng_rails/api/bf/constants'
      autoload :HttpRequester,  'betfair_api_ng_rails/api/bf/http_requester'
      autoload :HttpResponser,  'betfair_api_ng_rails/api/bf/http_responser'
      autoload :Provider,       'betfair_api_ng_rails/api/bf/provider'
      autoload :SessionManager, 'betfair_api_ng_rails/api/bf/session_manager'

      module Parsers

        module Soccer

          autoload :CompetitionParser, 'betfair_api_ng_rails/api/bf/parsers/soccer/competition_parser'
          autoload :EventTypeParser,   'betfair_api_ng_rails/api/bf/parsers/soccer/event_type_parser'
          autoload :TimeRangeParser,   'betfair_api_ng_rails/api/bf/parsers/soccer/time_range_parser'
          autoload :EventParser,       'betfair_api_ng_rails/api/bf/parsers/soccer/event_parser'
          autoload :MarketTypeParser,  'betfair_api_ng_rails/api/bf/parsers/soccer/market_type_parser'
          autoload :CountryParser,     'betfair_api_ng_rails/api/bf/parsers/soccer/country_parser'
          autoload :VenueParser,       'betfair_api_ng_rails/api/bf/parsers/soccer/venue_parser'
          autoload :MarketCatalogueParser,       'betfair_api_ng_rails/api/bf/parsers/soccer/market_catalogue_parser'
          autoload :MarketBookParser,       'betfair_api_ng_rails/api/bf/parsers/soccer/market_book_parser'
          autoload :CurrentOrderParser,       'betfair_api_ng_rails/api/bf/parsers/soccer/current_order_parser'

        end

      end

    end

    module Soccer

      autoload :Requester,            'betfair_api_ng_rails/api/soccer/requester'
      autoload :CompetitionRequester, 'betfair_api_ng_rails/api/soccer/competition_requester'
      autoload :EventTypeRequester,   'betfair_api_ng_rails/api/soccer/event_type_requester'
      autoload :TimeRangeRequester,   'betfair_api_ng_rails/api/soccer/time_range_requester'
      autoload :EventRequester,       'betfair_api_ng_rails/api/soccer/event_requester'
      autoload :MarketTypeRequester,  'betfair_api_ng_rails/api/soccer/market_type_requester'
      autoload :CountryRequester,     'betfair_api_ng_rails/api/soccer/country_requester'
      autoload :VenueRequester,       'betfair_api_ng_rails/api/soccer/venue_requester'
      autoload :MarketCatalogueRequester,       'betfair_api_ng_rails/api/soccer/market_catalogue_requester'
      autoload :MarketBookRequester,       'betfair_api_ng_rails/api/soccer/market_book_requester'
      autoload :CurrentOrderRequester,       'betfair_api_ng_rails/api/soccer/current_order_requester'

    end

  end

  def self.config(&block)
    @_config ||= BetfairApiNgRails::Api::BF::Config
    block_given? ? yield(@_config) : @_config
  end

end
