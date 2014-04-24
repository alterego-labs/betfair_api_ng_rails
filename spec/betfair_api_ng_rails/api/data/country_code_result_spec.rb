require 'spec_helper'

describe BetfairApiNgRails::CountryCodeResult do
  
  include_examples 'data model', DataModelsYamlLoader.new.fetch('countryCodeResult')

end