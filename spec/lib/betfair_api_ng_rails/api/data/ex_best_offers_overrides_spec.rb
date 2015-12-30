require 'spec_helper'

describe BetfairApiNgRails::ExBestOffersOverrides do
  
  include_examples 'data model', DataModelsYamlLoader.new.fetch('exBestOffersOverrides')

end