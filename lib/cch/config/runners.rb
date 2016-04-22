Cch::Runner.configure :rubocop do |runner|
  runner.watch(/\.rb$/)
  runner.watch(/\.rake$/)
end

Cch::Runner.configure :haml_lint, gem: 'haml-lint' do |runner|
  runner.watch(/\.haml$/)
end

Cch::Runner.configure :rspec do |runner|
  runner.watch(/_spec\.rb$/)

  runner.watch(%r{^spec/spec_helper.rb$}, proc { %w(spec) })
  runner.watch(%r{^spec/rails_helper.rb$}, proc { %w(spec) })
  runner.watch(%r{^config/routes.rb$}, proc { %w(spec/routing spec/requests) })
  runner.watch(
    %r{^app/controllers/application_controller.rb$},
    proc { %w(spec/controllers spec/requests) }
  )

  runner.watch(%r{^lib/(.+)\.rb$}, proc { |m| %W(spec/#{m[1]}_spec.rb spec/lib/#{m[1]}_spec.rb) })
  runner.watch(%r{^app/(.+)\.rb$}, proc { |m| %W(spec/#{m[1]}_spec.rb) })
  runner.watch(
    %r{^app/controllers/(.+)_(controller)\.rb$},
    proc do |m|
      %W(spec/routing/#{m[1]}_routing_spec.rb spec/requests/#{m[1]}_spec.rb spec/features/#{m[1]}_spec.rb)
    end
  )
end

Cch::Runner.configure :cucumber do |runner|
  runner.watch(/\.feature$/)
end
