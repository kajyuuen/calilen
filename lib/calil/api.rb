require 'calil/library'
require 'calil/check'
require 'open-uri'
require 'json'

module Calil
  class API

    attr_reader :app_key

    ROOT_URL = 'http://api.calil.jp/'

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
      url = "#{ROOT_URL}library?app_key=#{@app_key+query}&format=json&callback="
      post_library_url(url)
    end

    def check_search(options={})
      query = ''
      options.each do |key, value|
        query += "&#{key}=#{value}"
      end
      url = "#{ROOT_URL}check?app_key=#{@app_key+query}&format=json&callback=no"
      Check.new(open(url) {|f| JSON.load(f)})
    end

    def post_library_url(url)
      json = open(url) {|f| JSON.load(f)}
      json.map {|hash| Library.new( hash ) }
    end
  end
end
