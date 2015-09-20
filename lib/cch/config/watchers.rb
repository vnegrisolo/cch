Cch::Setup.tap do |setup|
  setup.watcher_commands = [
    'git diff --name-only',
    'git diff --name-only --staged',
    'git ls-files --others --exclude-standard',
    'git diff --name-only ..master'
  ]
end
