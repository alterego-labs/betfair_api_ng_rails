require 'spec_helper'

describe BetfairApiNgRails::TimeRangeResult do
  
  include_examples 'data model', DataModelsYamlLoader.new.fetch('timeRangeResult') do

    describe "time range association" do
      
      its(:time_range)       { is_expected.to be_kind_of BetfairApiNgRails::TimeRange }

      its('time_range.from') { is_expected.to eq '23-04-2014' }

    end

  end

end