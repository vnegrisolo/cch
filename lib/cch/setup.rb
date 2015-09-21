module Cch
  class Setup
    class << self
      ATTRIBUTES = [:watcher_commands, :runners]
      attr_accessor(*ATTRIBUTES)

      def configure
        load_setup
        Cch.logger.debug("setup\n#{inspect}")
        self
      end

      def inspect
        ATTRIBUTES.map { |f| "     #{f} = #{send(f)}" }.join("\n")
      end

      def add_runner(runner, options = {})
        @runners ||= {}
        @runners[runner] = Runner.new(runner, options)
        yield @runners.fetch(runner) if block_given?
      end

      def run(runners)
        Array(runners).each { |runner| @runners.fetch(runner).on = true }
      end

      private

      def load_setup(file = 'Cchfile')
        load(file, true) if File.exist?(file)
      end
    end
  end
end
