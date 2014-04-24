require 'spec_helper'

describe BetfairApiNgRails::Competition do
  
  include_examples 'data model', DataModelsYamlLoader.new.fetch('competition')

end