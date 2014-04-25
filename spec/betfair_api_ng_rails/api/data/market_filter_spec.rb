require 'spec_helper'

describe BetfairApiNgRails::MarketFilter do
  
  include_examples 'data model', DataModelsYamlLoader.new.fetch('marketFilter')

end