require 'spec_helper'

describe BetfairApiNgRails::EventType do
  
  include_examples 'data model', DataModelsYamlLoader.new.fetch('eventType')

end