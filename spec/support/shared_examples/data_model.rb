shared_examples 'data model' do |resourceHash|

  let(:json) { resourceHash }
  let(:data)  { described_class.from_json(json) }

  subject { data }

  describe "loading from json" do

    it { is_expected.to be_kind_of described_class }

    resourceHash.each do |k, v|
      next unless v.is_a?(String)
      
      its(k.underscore)   { is_expected.to eq v }

    end

  end

  if described_class.method_defined?(:to_hash)

    describe "serialize to hash" do
      
      subject { data.to_hash }

      it { is_expected.to be_kind_of Hash }

      it { is_expected.to eq json }

    end

  end

end