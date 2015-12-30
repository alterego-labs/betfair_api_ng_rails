require 'spec_helper'

describe BetfairApiNgRails::CompetitionResult do
  
  include_examples 'data model', DataModelsYamlLoader.new.fetch('competitionResult') do

    describe "competition association" do
      
      its('competition.id') { is_expected.to eq '1' }

    end

  end

end