module Cch
  class Runner
    include Commands::Shell
    include Commands::FileSystem

    class << self
      attr_accessor :runners

      def configure(runner, options = {})
        @runners ||= {}
        @runners[runner] = Runner.new(runner, options)
        yield @runners.fetch(runner) if block_given?
      end

      def run(runners)
        Array(runners).each { |runner| @runners.fetch(runner).on = true }
      end

      def all
        runners.values
      end

      def where(options = {})
        runners = all
        runners = runners.select(&:on) if options[:on?]
        if (names = [options[:name]].flatten.compact).any?
          runners = runners.select { |r| names.include?(r.name) }
        end
        runners
      end
    end

    attr_reader :name, :patterns
    attr_accessor :command, :on

    def initialize(name, options = {})
      @name = name
      @command = "bundle exec #{options[:gem] || name} %{files}"
      @on = false
      @patterns = {}
    end

    def watch(pattern, transform = nil)
      @patterns[pattern] = transform
    end

    def run(files)
      files = filter_files(files, patterns)
      return unless run?(files)

      system_command(command % { files: files.join(' ') })
    end

    def run?(files)
      message = "running #{name.to_s.color(:black, :green)}"
      message << " for #{files.size.to_s.color(:yellow)} files=#{files}"
      Cch.logger.info(message)
      files.any?
    end
  end
end
