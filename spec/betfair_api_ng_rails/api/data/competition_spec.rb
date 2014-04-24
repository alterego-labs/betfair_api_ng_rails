require 'spec_helper'

describe BetfairApiNgRails::Competition do
  
  let(:json) { {'id' => 1, 'name' => 'World Cup 2014'} }
  let(:data) { described_class.from_json(json) }

  describe "loading from json" do

    subject { data }

    it { is_expected.to be_kind_of described_class }

    its(:id)   { is_expected.to eq 1 }
    its(:name) { is_expected.to eq 'World Cup 2014' }

  end

  describe "serialize to hash" do
    
    subject { data.to_hash }

    it { is_expected.to be_kind_of Hash }

    it { is_expected.to eq json }

  end

end