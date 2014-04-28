# BetfairApiNgRails

API-NG is Betfair's next generation API for developers looking to create automated betting systems or custom interfaces for themselves or for Betfair customers. Using this gem you may do calls to API-NG for fetching some interesting information about competitions, events and markets.

## Installation

Add this line to your application's Gemfile:

    gem 'betfair_api_ng_rails', '1.0.0'

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
