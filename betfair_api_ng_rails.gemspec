# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'betfair_api_ng_rails/version'

Gem::Specification.new do |spec|
  spec.name          = "betfair_api_ng_rails"
  spec.version       = BetfairApiNgRails::VERSION
  spec.authors       = ["sergio1990"]
  spec.email         = ["sergeg1990@gmail.com"]
  spec.description   = %q{Betfair API-NG for Rails}
  spec.summary       = %q{Provides accessing betfair.com api-ng using non-interactive login}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency             "colorize",      ">= 0.7.2"
  spec.add_dependency             "active_redis",  "0.0.9.1"
  spec.add_dependency             "activesupport", '>= 3.0.0'

  spec.add_development_dependency "bundler",       "~> 1.3"
  spec.add_development_dependency "rake",          ">= 10.3.0"
  # spec.add_development_dependency "activesupport", ">= 3.1.0"
  spec.add_development_dependency "rspec",         "~> 3.0.0.beta"
  spec.add_development_dependency "rspec-its",     "1.0.1"
  spec.add_development_dependency "pry-nav",       "0.2.3"
end