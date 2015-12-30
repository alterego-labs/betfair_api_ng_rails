require 'spec_helper'

describe BetfairApiNgRails::MarketTypeResult do
  
  include_examples 'data model', DataModelsYamlLoader.new.fetch('marketTypeResult')

end