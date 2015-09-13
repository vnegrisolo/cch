# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'cch/version'

Gem::Specification.new do |spec|
  spec.name          = 'cch'
  spec.version       = Cch::VERSION
  spec.authors       = ['Vinicius Ferreira Negrisolo']
  spec.email         = ['vinicius.negrisolo@gmail.com']

  spec.summary       = 'cch - check on changes for ruby projects'
  spec.description   = 'cch - check on changes for ruby projects'
  spec.homepage      = 'https://github.com/vnegrisolo/cch'
  spec.license       = 'MIT'

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = 'https://github.com/vnegrisolo/cch'
  else
    fail 'RubyGems 2.0 or newer is required to protect against public gem pushes.'
  end

  spec.files = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/}) || f.match(/^Cchfile$/)
  end
  spec.bindir        = 'bin'
  spec.executables   = %w(cch)
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.10'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'yard'
  spec.add_development_dependency 'rubocop'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'codeclimate-test-reporter'
end
