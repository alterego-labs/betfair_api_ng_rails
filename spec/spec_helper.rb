$TESTING=true
$:.unshift File.join(File.dirname(__FILE__), '..', 'lib')

require 'rspec/its'

require 'betfair_api_ng_rails'

RSpec.configure do |config|
  config.mock_with :rspec

  config.filter_run focus: true
  config.run_all_when_everything_filtered = true

  config.order = "random"
end