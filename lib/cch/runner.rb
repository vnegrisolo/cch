module Cch
  class Runner
    include Commands::Shell

    attr_reader :name, :patterns
    attr_accessor :command, :on

    def initialize(name)
      @name = name
      @command = "bundle exec #{@name} %{files}"
      @on = false
      @patterns = []
    end

    def watch(pattern)
      @patterns << pattern
    end

    def run(files)
      puts "=> running #{@name.to_s.color(:black, :green)}"
      files = filter_files(files)
      puts "=> #{files.size.to_s.color(:yellow)} files=#{files}"
      return unless run?(files)

      system_command(@command % { files: files.join(' ') })
    end

    def filter_files(files)
      filtered_files = patterns.flat_map { |pattern| files.grep(pattern) }
      puts "=> filtered_files='#{filtered_files}'" if Setup.debug

      filtered_files.sort.uniq.select { |f| File.exist?(f) }
    end

    def run?(files)
      files.size > 0
    end
  end
end
