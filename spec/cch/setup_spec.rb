require 'spec_helper'

RSpec.describe Cch::Setup do
  describe '.config' do
    subject(:setup) { described_class.config }

    it 'configures debug' do
      expect(setup['debug']).to be true
    end

    it 'configures the watch_commands' do
      expect(setup['watcher']['commands']).to eq([
        'git diff --name-only',
        'git diff --name-only --staged',
        'git ls-files --others --exclude-standard',
        'git diff --name-only ..master'
      ])
    end
  end
end
