require 'spec_helper'

describe BetfairApiNgRails::Api::Endpoints::Spanish do
  include_examples 'base endpoint'
  include_examples 'concrete endpoint', 'api.betfair.com', 'identitysso.betfair.es'
end

