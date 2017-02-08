require "calil/version"
require "calil/api"

module Calil
  # Calil.new(app_key: 'Your app_key')
  def self.new(app_key:)
    Calil::API.new(app_key: app_key)
  end
end
