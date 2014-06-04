$TESTING=true
$:.unshift File.join(File.dirname(__FILE__), '..', 'lib')

module ActiveRedis
  class Base
    def self.attributes(*args); end
  end
end

require 'rspec/its'
require 'betfair_api_ng_rails'

Dir[File.join(File.dirname(__FILE__), 'support/**/*.rb')].each { |f| require f }

RSpec.configure do |config|
  config.mock_with :rspec

  config.filter_run focus: true
  config.run_all_when_everything_filtered = true

  config.order = "random"
end