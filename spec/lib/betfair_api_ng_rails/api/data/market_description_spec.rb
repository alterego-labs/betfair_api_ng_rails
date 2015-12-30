require 'spec_helper'

describe BetfairApiNgRails::MarketDescription do
  
  include_examples 'data model', DataModelsYamlLoader.new.fetch('marketDescription')

end