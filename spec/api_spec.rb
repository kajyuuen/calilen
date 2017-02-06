require "spec_helper"

RSpec.describe Calil::API do
  let(:client) { Calil::API.new(app_key: '9c3c5e757ea16c77c6ff78aadc258f1d') }

  it "return app_key if client app_key are present" do
    expect(client.app_key).to eq('AK')
  end

  it "return url if client important_query are present" do
    expect(client.library_search({ pref:'青森県' })).to eq('http://api.calil.jp/library?app_key=AK&pref=青森県')
  end
end
