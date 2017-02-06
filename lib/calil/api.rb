module Calil
  class API

    attr_reader :app_key

    API_URL = 'http://api.calil.jp/library'

    def initialize(app_key:)
      @app_key = app_key
    end
  end
end
