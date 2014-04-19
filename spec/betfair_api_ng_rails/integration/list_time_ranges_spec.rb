require 'spec_helper'

module TestModule
  extend BetfairApiNgRails::Api::RequestMethods
end

describe "listTimeRanges request method" do

  it_behaves_like 'simple list filtering request', 'listTimeRanges' do

    let(:method_name)  { "list_time_ranges" }
    let(:result_class) { BetfairApiNgRails::TimeRangeResult }
    let(:result_hash)  { "{\"result\": [{\"marketCount\": 1, \"timeRange\": { \"to\": \"18-04-2014\", \"from\": \"18-04-2014\" }}]}" }

  end

end

