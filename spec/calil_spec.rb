require "spec_helper"

RSpec.describe Calil do

  let(:client) { Calil.new(app_key: 'AK') }

  it "has a version number" do
    expect(Calil::VERSION).not_to be nil
  end

  it "return app_key if client app_key are present" do
    Calil.new(app_key: 'AK')
    expect(client.app_key).to eq('AK')
  end
end
