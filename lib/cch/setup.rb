module Cch
  class Setup
    class << self
      ATTRIBUTES = %i(debug watcher_commands)
      attr_accessor(*ATTRIBUTES)

      def configure
        load_setup_files(%w(config/Cchfile Cchfile))
        puts "=> setup\n#{inspect}" if debug
        self
      end

      def inspect
        ATTRIBUTES.map { |f| "     #{f} = #{send(f)}" }.join("\n")
      end

      private

      def load_setup_files(files)
        files.each { |f| load(f, true) if File.exist?(f) }
      end
    end
  end
end
