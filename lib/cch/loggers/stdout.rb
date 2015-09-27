module Cch
  module Loggers
    class Stdout
      def log(level, message, time = Time.new)
        log_message = "=> #{'cch'.color(:cyan)} [#{time}] [#{level}] - #{message}"
        puts log_message
        log_message
      end
    end
  end
end
