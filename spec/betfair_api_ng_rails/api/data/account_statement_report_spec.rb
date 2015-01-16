require 'spec_helper'

describe BetfairApiNgRails::AccountStatementReport do
  include_examples 'data model', DataModelsYamlLoader.new.fetch('accountStatementReport') do

    describe "account statements association" do
      its(:account_statement) { is_expected.to be_kind_of Array }
    end
  end
end

