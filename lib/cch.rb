require 'yaml'

require 'cch/extensions/string'
require 'cch/version'
require 'cch/setup'
require 'cch/commands/shell'
require 'cch/commands/file_system'
require 'cch/watcher'
require 'cch/runner'

require 'cch/config/watchers'
require 'cch/config/runners'

module Cch
  class << self
    def run(args = [])
      puts "=> running cch with args='#{args}'"
      Setup.configure

      files = Watcher.files
      runners(args).each { |runner| runner.run(files) }
    end

    private

    def runners(names)
      filter = { on?: true }
      filter.merge!(name: names) if names.size > 0
      Runner.where(filter)
    end
  end
end
