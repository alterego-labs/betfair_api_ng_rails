require 'spec_helper'

describe BetfairApiNgRails::PriceProjection do
  
  include_examples 'data model', DataModelsYamlLoader.new.fetch('priceProjection') do

    describe "exBestOffersOverrides" do
      
      its(:ex_best_offers_overrides) { is_expected.to be_kind_of BetfairApiNgRails::ExBestOffersOverrides }

    end

  end

end