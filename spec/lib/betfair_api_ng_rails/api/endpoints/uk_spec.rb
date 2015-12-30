require 'spec_helper'

describe BetfairApiNgRails::Api::Endpoints::Uk do
  include_examples 'base endpoint'
  include_examples 'concrete endpoint', "api.betfair.com", "identitysso.betfair.com"
end
