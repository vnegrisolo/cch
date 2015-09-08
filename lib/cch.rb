require 'yaml'

require 'cch/extensions/string'
require 'cch/version'
require 'cch/setup'
require 'cch/commands/shell'
require 'cch/commands/file_system'
require 'cch/watcher'
require 'cch/runner'

module Cch
  class << self
    def run(args)
      puts "=> running cch with args='#{args}'"
      Setup.configure

      files = Watcher.new.files
      runners.each { |runner| runner.run(files) if runner.on }
    end

    private

    def runners
      Setup.runners.values
    end
  end
end
