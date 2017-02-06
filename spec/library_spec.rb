require "spec_helper"

RSpec.describe Calil::Library do
  let(:client) { Calil::API.new(app_key: 'AK') }
  it "return true if the user app_key are present" do
    expect(client.library({ pref:'青森県' })).to eq('AK')
  end
end
