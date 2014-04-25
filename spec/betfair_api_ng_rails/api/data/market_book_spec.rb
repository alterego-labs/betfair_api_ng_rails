require 'spec_helper'

describe BetfairApiNgRails::MarketBook do
  
  include_examples 'data model', DataModelsYamlLoader.new.fetch('marketBook') do

    describe "runners association" do
      
      its(:runners) { is_expected.to be_kind_of Array }

    end

  end

end