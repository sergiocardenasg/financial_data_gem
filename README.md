# FinancialData

Get data on global equities (open, high, low, close, volume, and percent change) with this easy-to-use Ruby gem, covering 20+ years of historical data. 

An optional market snapshot on the date of your selection is available, too!

Create your own watchlist as well with as many stocks as you'd like!

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'financial_data'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install financial_data

## Usage

After installing the gem, the console will ask you to enter a ticker symbol (which is validated), and a date (which is also validated). The program will return the closing price and delta for the stock on the day you chose, and ask if you'd like to add that stock to a watchlist. After, you'll get the option to see where the markets closed on that date.

You'll then be routed to the menu, where you can:
1) Get info and add a new stock to your watchlist,
2) See your watchlist and its components with the option to get more data or remove from watchlist, or
3) Exit the program.

The watchlist will erased every time the program is closed.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/<github username>/financial_data. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/<github username>/financial_data/blob/master/CODE_OF_CONDUCT.md).


## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the FinancialData project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/<github username>/financial_data/blob/master/CODE_OF_CONDUCT.md).
