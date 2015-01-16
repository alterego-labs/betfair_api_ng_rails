require 'spec_helper'

describe BetfairApiNgRails::StatementItem do
  include_examples 'data model', DataModelsYamlLoader.new.fetch('statementItem') do
    describe 'legacy data association' do
      its(:legacy_data) { is_expected.to be_kind_of BetfairApiNgRails::StatementLegacyData }
    end
  end
end
