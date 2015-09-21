require 'yaml'

require 'cch/extensions/string'
require 'cch/version'
require 'cch/commands/shell'
require 'cch/commands/file_system'
require 'cch/watcher'
require 'cch/runner'
require 'cch/loggers/level'
require 'cch/loggers/stdout'
require 'cch/logger'
require 'cch/setup'

module Cch
  class << self
    def logger
      @logger ||= Logger.new(:info, Loggers::Stdout.new)
    end

    def setup
      return @setup if @setup
      @setup = Setup
      Setup.configure
      @setup
    end

    def run(args = [])
      logger.info("running cch with args='#{args}'")
      files = Watcher.files
      runners(args).each { |runner| runner.run(files) }
    end

    private

    def runners(names)
      Runner.where(on?: true, name: names)
    end
  end
end
