require 'calil/library'
require 'open-uri'
require 'json'

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
      query = ''
      options.each do |key, value|
        query += "&#{key}=#{value}"
      end
      url = "#{API_URL}?app_key=#{@app_key+query}&format=json&callback="
      post_url(url)
    end

    # Post url
    def post_url(url)
      json = open(url) {|f| JSON.load(f)}
      json.each do |value|
        return Library.new( value.map{|k,v| [k.to_sym, v] }.to_h )
      end
      #json#.to_h.map{|k,v| [k.to_sym, v] }.to_h
    end
  end
end
