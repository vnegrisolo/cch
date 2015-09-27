module Cch
  class Runner
    include Commands::Shell
    include Commands::FileSystem

    attr_reader :name, :patterns
    attr_accessor :command, :on

    def self.all
      Cch.setup.runners.values
    end

    def self.where(options = {})
      runners = all
      runners = runners.select(&:on) if options[:on?]
      if (names = [options[:name]].flatten.compact).size > 0
        runners = runners.select { |r| names.include?(r.name) }
      end
      runners
    end

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
      files.size > 0
    end
  end
end
