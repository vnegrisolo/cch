# cch
**CCH** - Check on changes for ruby projects

**cch** will list all files that has been changed so far and run what you need with them (tests, code lints, etc).

In order words, it will use `git` to see the changes and then run a command like `rspec` with this files.

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

Or on run time, you can specify the runners:

```shell
cch rspec rubocop
```

## Configuration

After running **cch** for the first time, the script will create a config file for you: `cchfile.rb`.

Configure through the `cchfile.rb` what you want to run by **cch**:

```ruby
Cch::Runner.run [:rubocop, :haml_lint, :rspec]
```

**Cch** comes with some basic configuration for:

- rspec
- rubocop
- haml_lint

You can create your own configuration in your `cchfile.rb`. Use the following configuration files as the base for it:

- [watcher](https://github.com/vnegrisolo/cch/blob/master/lib/cch/config/watchers.rb)
- [runners](https://github.com/vnegrisolo/cch/blob/master/lib/cch/config/runners.rb)

## Development

1. checking out the repo
2. run `bin/setup` to install dependencies
3. run `bundle exec rake` to run the all necessary checks like documentation, code style and tests

You can also run `bin/console` for an interactive prompt that will allow you to experiment.

### Install locally

```
bundle exec rake install
gem install --local pkg/cch*.gem
```

### Release a new version

To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org/gems/cch).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/vnegrisolo/cch. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](https://github.com/vnegrisolo/cch/blob/master/CONTRIBUTING.md) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://github.com/vnegrisolo/cch/blob/master/LICENSE.md).
