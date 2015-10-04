module Cch
  class Setup
    ATTRIBUTES = [:runners]
    attr_accessor(*ATTRIBUTES)

    def configure
      %w(logger watchers runners).each do |config_file|
        require "cch/config/#{config_file}"
      end

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
