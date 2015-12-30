require 'spec_helper'

describe BetfairApiNgRails::TimeRange do
  include_examples 'data model', DataModelsYamlLoader.new.fetch('timeRange')
end
