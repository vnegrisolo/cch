require 'yaml'

require 'cch/extensions/string'
require 'cch/version'
require 'cch/commands/shell'
require 'cch/commands/file_system'
require 'cch/watcher'
require 'cch/runner'
require 'cch/logger'
require 'cch/setup'

module Cch
  class << self
    def logger
      @logger ||= Logger.new
    end

    def setup
      @setup ||= Setup.new
    end

    def run(args = [])
      setup.configure

      files = Watcher.files

      runners(args).each { |runner| runner.run(files) }
    end

    private

    def runners(args)
      names = args.flatten.compact
      query = names.any? ? { name: names } : { on?: true }
      Runner.where(query)
    end
  end
end
