require 'spec_helper'

describe BetfairApiNgRails::RunnerCatalog do
  
  include_examples 'data model', DataModelsYamlLoader.new.fetch('runnerCatalog')

end