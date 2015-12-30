require 'spec_helper'

describe BetfairApiNgRails::Api::Endpoints::Australian do
  include_examples 'base endpoint'
  include_examples 'concrete endpoint', 'api-au.betfair.com', 'identitysso.betfair.com'
end
