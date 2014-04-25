require 'spec_helper'

describe BetfairApiNgRails::StartingPrices do
  
  include_examples 'data model', DataModelsYamlLoader.new.fetch('startingPrices')

end