$TESTING=true
$:.unshift File.join(File.dirname(__FILE__), '..', 'lib')

require 'rspec/its'
require 'betfair_api_ng_rails'

Dir[File.join(File.dirname(__FILE__), 'support/**/*.rb')].each { |f| require f }

module TestModule
  extend BetfairApiNgRails::Api::RequestMethods::All
end

RSpec.configure do |config|
  config.mock_with :rspec

  config.filter_run focus: true
  config.run_all_when_everything_filtered = true

  config.order = "random"
end

BetfairApiNgRails.config do |config|
  config.endpoint = :uk
end
