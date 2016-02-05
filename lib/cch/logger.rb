require 'cch/loggers/level'
require 'cch/loggers/stdout'

module Cch
  class Logger
    attr_accessor :threshold, :implementation

    def initialize(options = {})
      @threshold = options[:threshold] || :info
      @implementation = options[:implementation] || Loggers::Stdout.new
    end

    Loggers::Level.all.each do |level_name, level|
      define_method(level_name) do |message|
        log(level, message)
      end
    end

    private

    def log(level, message)
      return unless level.allowed?(threshold)

      implementation.log(level, message)
    end
  end
end
