require "spec_helper"

RSpec.describe Calil::API do
  let(:client) { Calil.new(app_key: 'AK') }

  it "return app_key if client app_key are present" do
    expect(client.app_key).to eq('AK')
  end
end
