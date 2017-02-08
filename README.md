# Calil

[カーリル](https://calil.jp/)のAPIマッパー
## Installation

Add this line to your application's Gemfile:

```ruby
gem 'calil'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install calil

## Usage

Use library database

```ruby
client= Calil.new(app_key: 'Your app_key')

# http://api.calil.jp/library?appkey={Your app_key}&pref=埼玉県
libraries = client.library_search(pref: '埼玉県')

# http://api.calil.jp/library?appkey={Your app_key}&geocode=136.7163027,35.390516&limit=10
libraries = client.library_search(geocode: '7163027,35.390516', limit: 10)

libraries.each |s|
  p s.systemid #=>Tokyo_NDL
  p s.libkey #=>東京本館
end
```

Library search

```ruby
client= Calil.new(app_key: 'Your app_key')

# http://api.calil.jp/check?appkey={Your app_key}&isbn=4834000826&systemid=Aomori_Pref&format=json
book = client.library_search(isbn: 4834000826, systemid: 'Aomori_Pref')

libraries.each |s|
  p s.session #=>11a285036112525afe32b1a3d4c36245
  p s.books
end

# http://api.calil.jp/check?session=11a285036112525afe32b1a3d4c36245&format=json
book.polling
```


## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/calil. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
