require 'calil/library'
require 'faraday'

module Calil
  class API

    attr_reader :app_key

    API_URL = 'http://api.calil.jp/library'

    def initialize(app_key:)
      @app_key = app_key
    end

    def library(options={})
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
