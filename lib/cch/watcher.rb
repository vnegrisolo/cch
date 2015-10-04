module Cch
  class Watcher
    include Commands::Shell

    class << self
      attr_accessor :commands

      def files
        new.files(commands)
      end
    end

    def files(commands)
      files = commands.flat_map { |command| backtiq_command(command) }.compact.sort.uniq
      Cch.logger.info("watching #{files.size.to_s.color(:yellow)} files=#{files}")
      files
    end
  end
end
