require 'spec_helper'

describe BetfairApiNgRails::ExchangePrices do
  
  include_examples 'data model', DataModelsYamlLoader.new.fetch('exchangePrices') do

    its(:traded_volume)     { is_expected.to be_kind_of Array }

    its(:available_to_back) { is_expected.to be_kind_of Array }

    its(:available_to_lay)  { is_expected.to be_kind_of Array }

  end

end