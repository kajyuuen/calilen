module Calil
  class API

    attr_reader :app_key

    API_URL = 'http://api.calil.jp/library'

    # API.new(app_key: 'Your app_key')
    def initialize(app_key:)
      @app_key = app_key
    end

    # Use library database
    def library_search(options={})
      # TODO: @app_keyが無いときのエラーハンドリング
      if options[:pref] || options[:systemid] || options[:geocode]
        query = ''
        options.each do |key, value|
          query += "&#{key}=#{value}"
        end
        url = "#{API_URL}?app_key=#{@app_key+query}"
      else
        # TODO: 必須項目が無いときのエラーハンドリング
      end
    end
  end
end
