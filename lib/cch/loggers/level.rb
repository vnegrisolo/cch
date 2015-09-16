module Cch
  module Loggers
    class Level
      LEVELS = %i(debug info error)

      def self.all
        return @levels if @levels

        @levels = LEVELS.map { |level| [level, new(level)] }.to_h
      end

      attr_reader :name

      def initialize(name)
        @name = name
      end

      def allowed?(threshold)
        LEVELS.index(threshold) <= LEVELS.index(name)
      end

      def to_s
        name.to_s.upcase.color(color)
      end

      private

      def color
        case name
        when :debug then :pink
        when :info then :cyan
        when :error then :red
        else :yellow
        end
      end
    end
  end
end
