module Cch
  class Setup
    class << self
      ATTRIBUTES = [:debug, :watcher_commands, :runners]
      attr_accessor(*ATTRIBUTES)

      def configure
        load_setup_files(%w(config/Cchfile Cchfile))
        puts "=> setup\n#{inspect}" if debug
        self
      end

      def inspect
        ATTRIBUTES.map { |f| "     #{f} = #{send(f)}" }.join("\n")
      end

      def add_runner(runner)
        @runners ||= {}
        @runners[runner] = Runner.new(runner)
        yield @runners[runner] if block_given?
      end

      def run(runner)
        runners.fetch(runner).on = true
      end

      private

      def load_setup_files(files)
        files.each { |f| load(f, true) if File.exist?(f) }
      end
    end
  end
end
