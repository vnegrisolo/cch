# cch
CCH - Check on changes for ruby projects

## gem status

[![Build Status](https://travis-ci.org/vnegrisolo/cch.svg)](https://travis-ci.org/vnegrisolo/cch)
[![Code Climate](https://codeclimate.com/github/vnegrisolo/cch/badges/gpa.svg)](https://codeclimate.com/github/vnegrisolo/cch)
[![Test Coverage](https://codeclimate.com/github/vnegrisolo/cch/badges/coverage.svg)](https://codeclimate.com/github/vnegrisolo/cch/coverage)
[![Dependency Status](https://gemnasium.com/vnegrisolo/cch.svg)](https://gemnasium.com/vnegrisolo/cch)

## Installation

```shell
gem install cch
```

Create a `Cchfile` on your project folder:

```ruby
Cch::Setup.tap do |setup|
  setup.run :rspec
  setup.run :rubocop
end
```

## Usage

```shell
cch
```

## Development

1. checking out the repo
2. run `bin/setup` to install dependencies
3. run `bundle exec rake` to run the all necessary checks like documentation, code style and tests

You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`.

To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org/gems/cch).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/vnegrisolo/cch. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](https://github.com/vnegrisolo/cch/blob/master/CONTRIBUTING.md) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](https://github.com/vnegrisolo/cch/blob/master/LICENSE.md).
