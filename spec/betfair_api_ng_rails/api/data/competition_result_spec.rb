require 'spec_helper'

describe BetfairApiNgRails::CompetitionResult do
  
  let(:json) { {'marketCount' => '1', 'competitionRegion' => 'UA', 'competition' => {'id' => 1, 'name' => 'World Cup 2014'}} }
  let(:data) { described_class.from_json(json) }

  describe "loading from json" do

    subject { data }

    it { is_expected.to be_kind_of described_class }

    its(:market_count)       { is_expected.to eq '1' }
    its(:competition_region) { is_expected.to eq 'UA' }
    its(:competition)        { is_expected.to be_kind_of BetfairApiNgRails::Competition }

  end

end