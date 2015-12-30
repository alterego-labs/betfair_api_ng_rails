require 'spec_helper'

describe BetfairApiNgRails::MarketCatalogue do
  
  include_examples 'data model', DataModelsYamlLoader.new.fetch('marketCatalogue') do

    describe "description association" do
      
      its(:description) { is_expected.to be_kind_of BetfairApiNgRails::MarketDescription }

    end

    describe "runners association" do
      
      its(:runners) { is_expected.to be_kind_of Array }

    end

    describe "event type association" do
      
      its(:event_type) { is_expected.to be_kind_of BetfairApiNgRails::EventType }

    end

    describe "competition association" do
      
      its(:competition) { is_expected.to be_kind_of BetfairApiNgRails::Competition }

    end

    describe "event association" do
      
      its(:event) { is_expected.to be_kind_of BetfairApiNgRails::Event }

    end

  end

end