# Cch.logger.threshold = :info
# Cch.logger.implementation = Cch::Loggers::Stdout.new

Cch::Runner.run [:rubocop, :rspec]
