shared_examples 'concrete endpoint' do |api_domain, login_domain|
  describe '#api_url' do
    describe 'builded URL' do
      subject(:url) { described_class.new.api_url(:betting) }

      it { is_expected.to include(api_domain) }
      it { is_expected.to include('betting') }
    end
  end

  describe '#login_url' do
    describe 'builded URL' do
      subject(:url) { described_class.new.login_url }

      it { is_expected.to include(login_domain) }
      it { is_expected.to include('/certlogin') }
    end
  end

  describe '#keep_alive_url' do
    describe 'builded URL' do
      subject(:url) { described_class.new.keep_alive_url }

      it { is_expected.to include(login_domain) }
      it { is_expected.to include('/keepAlive') }
    end
  end
end
