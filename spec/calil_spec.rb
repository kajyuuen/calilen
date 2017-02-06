require "spec_helper"

RSpec.describe Calil::API do
  it "return true if the user app_key are present" do
    client = Calil::API.new(app_key: 'AK')
    expect(client.app_key).to eq('AK')
  end
end
