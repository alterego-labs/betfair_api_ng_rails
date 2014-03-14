require './lib/api/soccer/requester'
require './lib/api/bf/provider'

class Api::Soccer::CompetitionRequester < Api::Soccer::Requester

  def initialize(provider: '')
    @data = :competition
    super provider
  end

  def load(parameters: {})
    make_fetch parameters: parameters
  end

end