require 'bundler/gem_tasks'
require 'yard'
require 'rubocop/rake_task'
require 'rspec/core/rake_task'

YARD::Rake::YardocTask.new do |t|
  t.files = ['lib/**/*.rb']
  t.stats_options = ['--list-undoc']
end

RuboCop::RakeTask.new(:rubocop) do |task|
  task.formatters = ['fuubar']
end

RSpec::Core::RakeTask.new(:spec)

task default: [:yard, :rubocop, :spec]
