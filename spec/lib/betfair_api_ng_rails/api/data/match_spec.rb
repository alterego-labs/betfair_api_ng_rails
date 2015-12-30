require 'spec_helper'

describe BetfairApiNgRails::Match do
  
  include_examples 'data model', DataModelsYamlLoader.new.fetch('match')

end