module Cch
  module Commands
    module Shell
      def backtiq_command(command)
        log_command(command)
        (`#{command}` || '').split(/\n/)
      end

      def system_command(command)
        log_command(command)
        system(command)
      end

      private

      def log_command(command)
        puts "=> command='#{command}'" if Setup.debug
      end
    end
  end
end
