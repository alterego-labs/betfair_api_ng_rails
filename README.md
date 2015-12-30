# BetfairApiNgRails

API-NG is Betfair's next generation API for developers looking to create automated betting systems or custom interfaces for themselves or for Betfair customers. Using this gem you may do calls to API-NG for fetching some interesting information about competitions, events and markets.

## Installation

Add this line to your application's Gemfile:

    gem 'betfair_api_ng_rails', '2.0.0'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install betfair_api_ng_rails

Or if you want to stay on the edge:

    gem 'betfair_api_ng_rails', github: 'alterego-labs/betfair_api_ng_rails'

After this run next rake command:

    $ bundle exec rake betfair_api_ng_rails:install

After installation will appear two files:

```
config/betfair_api_ng_rails.yml
config/initializers/betfair_api_ng_rails.rb
```

In this files you must specify credentials to API-NG. Also you should notice that this gem used non-interactive login and you must generate ssh keys for logining well. More information about this you may find [there](https://api.developer.betfair.com/services/webapps/docs/display/1smk3cen4v3lu3yomq5qye0ni/Non-Interactive+%28bot%29+login).

## Usage

Please check [wiki pages](https://github.com/alterego-labs/betfair_api_ng_rails/wiki).

## CHANGES IN 2.1.0

1. Extracted endpoints for easy using Australian, Italian, Spanish and
   UK exchanges.
2. Added `market_ids` to MarketFilter data class
3. Tiny refactorings

## CHANGES IN 2.0.0

One of the main features of this release was the multiaccounting.
Since version 1.5.0 is now available opportunity to place bets using placeOrders method. But at the same time there was another problem - to place bets in various Betfair accounts, and that the current implementation does not allow. Starting with version 2.0.0 is such an opportunity exists. But just be careful: if you want to use version 2.0.0 in an existing project, you have to do a small step:

```ruby
BetfairApiNgRails.config do |config|
  # Rest of configuration same as for 1.5.0

  # Setting up account
  BetfairApiNgRails.account_manager.store BetfairApiNgRails::Account.new(config.username,
                                                                         config.password,
                                                                         config.application_key,
                                                                         config.ssl_crt_filepath,
                                                                         config.ssl_key_filepath)
  BetfairApiNgRails.account_manager.default config.username
end
```

For additional info please visit [specific wiki page](https://github.com/alterego-labs/betfair_api_ng_rails/wiki/Multiaccounting).

## CHANGES IN 1.5.0

1. Add supporting **placeOrders** method

## CHANGES IN 1.1.0

1. Supporting all [Simple listing filtered requests](https://github.com/alterego-labs/betfair_api_ng_rails/wiki/Simple-listing-filtered-requests)
2. Supporting **listMarketCatalogue** and **listMarketBook** methods
3. Raising APINGException if error occurred similar official API-NG
4. Refactoring and testing

## CHANGES IN 1.0.0

1. Replaced ActiveRecord style querying by more similar structure to API-NG
2. Starting to testing
3. Refactoring

## CHANGES IN 0.0.8

1. Fixing more of bugs
2. Came back formatters and out-of-box exists formatter for JsTree
3. Added all enums
4. Added shortcuts for models
5. Refactoring

## Specs

You may running all specs by `rspec spec --color` to be sure that all is alright.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
