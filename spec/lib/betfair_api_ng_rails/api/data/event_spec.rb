require 'spec_helper'

describe BetfairApiNgRails::Event do
  
  include_examples 'data model', DataModelsYamlLoader.new.fetch('event')

end