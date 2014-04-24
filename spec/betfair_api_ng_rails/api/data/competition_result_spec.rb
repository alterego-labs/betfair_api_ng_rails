require 'spec_helper'

describe BetfairApiNgRails::CompetitionResult do
  
  include_examples 'data model', DataModelsYamlLoader.new.fetch('competitionResult')

end