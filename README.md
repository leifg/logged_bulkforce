# LoggedBulkforce

Just a little wrapper around [Bulkforce](https://github.com/propertybase/bulkforce) to output results to csv on disk

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'logged_bulkforce'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install logged_bulkforce

## Usage

```ruby
client = Bulkforce.new(
  username: "YOUR_SALESFORCE_USERNAME",
  password: "YOUR_SALESFORCE_PASSWORD",
  security_token: "YOUR_SALESFORCE_TOKEN",
  dir: "./logs"
)

logged_client = LoggedBulkforce.new(client, "./logs")

client.execute(:upsert, <SF-Entity>, <Data>)
```

For detailed instructions on how to initialize bulkforce, see [the repo](https://github.com/propertybase/bulkforce)

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/logged_bulkforce. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.
