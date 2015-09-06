require 'bundler/gem_tasks'
require 'rubocop/rake_task'
require 'rspec/core/rake_task'

RuboCop::RakeTask.new(:rubocop) do |task|
  task.formatters = ['fuubar']
end

RSpec::Core::RakeTask.new(:spec)

task default: %i(rubocop spec)
