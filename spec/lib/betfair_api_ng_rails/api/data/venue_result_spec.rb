require 'spec_helper'

describe BetfairApiNgRails::VenueResult do
  
  include_examples 'data model', DataModelsYamlLoader.new.fetch('venueResult')

end