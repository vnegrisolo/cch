module Cch
  class Logger
    attr_accessor :threshold, :implementation

    def initialize(options = {})
      @threshold = options[:threshold]
      @implementation = options[:implementation]
    end

    Loggers::Level.all.each do |level_name, level|
      define_method(level_name) do |message|
        log(level, message)
      end
    end

    private

    def log(level, message)
      return unless implementation && level.allowed?(threshold)

      implementation.log(level, message)
    end
  end
end
