require 'spec_helper'

describe BetfairApiNgRails::PriceSize do
  
  include_examples 'data model', DataModelsYamlLoader.new.fetch('priceSize')

end