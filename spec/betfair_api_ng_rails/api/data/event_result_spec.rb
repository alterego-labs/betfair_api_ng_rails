require 'spec_helper'

describe BetfairApiNgRails::EventResult do
  
  include_examples 'data model', DataModelsYamlLoader.new.fetch('eventResult') do

    describe "event association" do
      
      its('event.id')   { is_expected.to eq '1' }
      its('event.name') { is_expected.to eq 'Chelse - PSG' }

    end

  end

end