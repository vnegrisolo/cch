module Cch
  class Watcher
    include Commands::Shell

    def initialize(commands = nil)
      @commands = commands || Setup.config['watcher']['commands']
    end

    def files
      files = @commands.flat_map { |command| backtiq_command(command) }.compact.sort.uniq
      puts "=> watched files='#{files}'" if Setup.config['debug']
      files
    end
  end
end
