require 'spec_helper'

describe BetfairApiNgRails::Api::Endpoints::Italian do
  include_examples 'base endpoint'
  include_examples 'concrete endpoint', 'api.betfair.com', 'identitysso.betfair.it'
end
