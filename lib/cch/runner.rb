module Cch
  class Runner
    include Commands::Shell
    include Commands::FileSystem

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
      puts "=> running #{name.to_s.color(:black, :green)}"
      filtered_files = filter_files(files, patterns)
      return unless run?(filtered_files)

      system_command(command % { files: filtered_files.join(' ') })
    end

    def run?(files)
      files.size > 0
    end
  end
end
