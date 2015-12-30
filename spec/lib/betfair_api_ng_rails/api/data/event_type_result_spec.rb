require 'spec_helper'

describe BetfairApiNgRails::EventTypeResult do
  
  include_examples 'data model', DataModelsYamlLoader.new.fetch('eventTypeResult') do

    describe "event type association" do
      
      its('event_type.id')   { is_expected.to eq 1 }
      its('event_type.name') { is_expected.to eq 'Soccer' }

    end

  end

end