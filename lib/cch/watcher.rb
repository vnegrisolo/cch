module Cch
  class Watcher
    include Commands::Shell

    def self.files
      new.files
    end

    def initialize(commands = nil)
      @commands = commands || Setup.watcher_commands
    end

    def files
      files = @commands.flat_map { |command| backtiq_command(command) }.compact.sort.uniq
      Cch.logger.info("watched files='#{files}'")
      files
    end
  end
end
