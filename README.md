# cch
**CCH** - Run your test suite for just changed files

You just need to run:

```shell
cch
```

And then **cch** will:

1. List changed files using git commands
2. Expand files using regexp
3. Run with these files your **tests**, **code lints**

## gem status

[![Build Status](https://travis-ci.org/vnegrisolo/cch.svg)](https://travis-ci.org/vnegrisolo/cch)
[![Gem Version](https://badge.fury.io/rb/cch.svg)](http://badge.fury.io/rb/cch)
[![Code Climate](https://codeclimate.com/github/vnegrisolo/cch/badges/gpa.svg)](https://codeclimate.com/github/vnegrisolo/cch)
[![Test Coverage](https://codeclimate.com/github/vnegrisolo/cch/badges/coverage.svg)](https://codeclimate.com/github/vnegrisolo/cch/coverage)
[![Dependency Status](https://gemnasium.com/vnegrisolo/cch.svg)](https://gemnasium.com/vnegrisolo/cch)
[![Yard Docs](http://img.shields.io/badge/yard-docs-blue.svg)](http://www.rubydoc.info/github/vnegrisolo/cch)

## Installation

```shell
gem install cch
```

## Usage

```shell
cch
```

Or specify the runners:

```shell
cch rspec rubocop
```

## Configuration

After running **cch** for the first time, a config file is created with:

```ruby
Cch::Runner.run [:rubocop, :haml_lint, :rspec, :cucumber]
```

**Cch** comes with some basic configuration for:

- rspec
- rubocop
- haml_lint
- cucumber

You can create your own configuration in your `cchfile.rb`. Use the following configuration files as the base for it:

- [watcher](https://github.com/vnegrisolo/cch/blob/master/lib/cch/config/watchers.rb)
- [runners](https://github.com/vnegrisolo/cch/blob/master/lib/cch/config/runners.rb)

You can also change the default configurations for existing runners.

## Development

```shell
git clone git@github.com:vnegrisolo/cch.git
./bin/setup
bundle exec rake
```

You can also run `bin/console` for an interactive prompt that will allow you to experiment.

### Install locally

```
bundle exec rake install
gem install --local pkg/cch*.gem
```

### Release a new version

Change `version.rb` file, commit, push and then:

```
bundle exec rake release
```

This will deploy a new release on [rubygems.org](https://rubygems.org/gems/cch).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/vnegrisolo/cch. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](https://github.com/vnegrisolo/cch/blob/master/CONTRIBUTING.md) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://github.com/vnegrisolo/cch/blob/master/LICENSE.md).
test
