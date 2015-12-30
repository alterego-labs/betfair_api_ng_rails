shared_examples 'base endpoint' do
  it { is_expected.to respond_to :api_url }
  it { is_expected.to respond_to :login_url }
  it { is_expected.to respond_to :keep_alive_url }
end
