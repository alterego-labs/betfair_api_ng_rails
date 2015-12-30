require 'spec_helper'

describe BetfairApiNgRails::Order do
  
  include_examples 'data model', DataModelsYamlLoader.new.fetch('order')

end