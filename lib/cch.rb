require 'yaml'

require 'cch/version'
require 'cch/setup'
require 'cch/commands/shell'
require 'cch/watcher'

module Cch
  class << self
    def run(args)
      puts "=> running cch with args='#{args}'"
      Watcher.new.files
    end
  end
end
