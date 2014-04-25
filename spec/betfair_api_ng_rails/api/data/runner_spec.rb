require 'spec_helper'

describe BetfairApiNgRails::Runner do
  
  include_examples 'data model', DataModelsYamlLoader.new.fetch('runner') do

    describe "starting prices association" do
      
      its(:sp) { is_expected.to be_kind_of BetfairApiNgRails::StartingPrices }

    end

    describe "exchange prices association" do
      
      its(:ex) { is_expected.to be_kind_of BetfairApiNgRails::ExchangePrices }

    end

    describe "orders association" do
      
      its(:orders) { is_expected.to be_kind_of Array }

    end

    describe "matches association" do
      
      its(:matches) { is_expected.to be_kind_of Array }

    end

  end

end