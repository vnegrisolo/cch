module Cch
  class Setup
    ATTRIBUTES = [:watcher_commands, :runners]
    attr_accessor(*ATTRIBUTES)

    def configure
      require 'cch/config/watchers'
      require 'cch/config/runners'

      load('Cchfile', true) if File.exist?('Cchfile')

      Cch.logger.debug("setup={#{inspect}}")
    end

    def inspect
      ATTRIBUTES.map { |f| "#{f}=#{send(f)}" }.join(', ')
    end

    def add_runner(runner, options = {})
      @runners ||= {}
      @runners[runner] = Runner.new(runner, options)
      yield @runners.fetch(runner) if block_given?
    end

    def run(runners)
      Array(runners).each { |runner| @runners.fetch(runner).on = true }
    end
  end
end
