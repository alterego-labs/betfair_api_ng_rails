# BetfairApiNgRails

API-NG is Betfair's next generation API for developers looking to create automated betting systems or custom interfaces for themselves or for Betfair customers. Using this gem you may do calls to API-NG for fetching some interesting information about competitions, events and markets.

## WARNING!!!

_Last version of gem supports only list* requests._

## Installation

Add this line to your application's Gemfile:

    gem 'betfair_api_ng_rails'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install betfair_api_ng_rails

After this run next rake command:

    $ bundle exec rake betfair_api_ng_rails:install

After installation will appear two files _config/betfair_api_ng_rails.yml_ and _config/initializers/betfair_api_ng_rails.rb_. In this files you must specify credentials to API-NG. Also you should notice that this gem used non-interactive login and you must generate ssh keys for logining well. Most information about this you may find [there](https://api.developer.betfair.com/services/webapps/docs/display/1smk3cen4v3lu3yomq5qye0ni/Non-Interactive+%28bot%29+login).

## Usage

Sample code for fetching competitions list:

```ruby
requester = BetfairApiNgRails::Api::Soccer::CompetitionRequester.new provider: :bf
res = requester.load
```

For all available methods see [there](https://api.developer.betfair.com/services/webapps/docs/display/1smk3cen4v3lu3yomq5qye0ni/Betting+Operations).

Also you may passing filering params in _load_:

```ruby
requester = BetfairApiNgRails::Api::Soccer::CompetitionRequester.new provider: :bf
res = requester.load parameters: { event_ids: [1, 2] }
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
