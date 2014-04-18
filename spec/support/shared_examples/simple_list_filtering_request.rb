shared_examples 'simple list filtering request' do |method|

  let(:parameters)   { {filter: filter} }

  before(:each) { BetfairApiNgRails.config.formatter = nil }

  context 'when no error occured' do

    it_behaves_like 'request method' do

      it { is_expected.not_to be_empty }

      its(:first) { is_expected.to be_kind_of result_class }

    end

  end

  context 'when api error occured' do

    it_behaves_like 'request method' do

      let(:result_hash) { "{\"error\":{\"code\":-32700,\"message\":\"DSC-3000\"}}" }

      it { is_expected.to be_empty }

    end

  end

  if BetfairApiNgRails::Api::Constants::ALLOWED_FORMATTING.include?(method)

    context 'when enabled formatting' do

      before(:each) { BetfairApiNgRails.config.formatter = :js_tree }

      it_behaves_like 'request method' do

        it { is_expected.not_to be_empty }

        its(:first) { is_expected.to be_kind_of Hash }

        its('first.keys') { is_expected.to include(:id, :text, :children, :data) }

      end

    end

  end

end