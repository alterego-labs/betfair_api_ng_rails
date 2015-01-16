require 'spec_helper'

describe BetfairApiNgRails::StatementLegacyData do
  include_examples 'data model', DataModelsYamlLoader.new.fetch('statementLegacyData')
end

