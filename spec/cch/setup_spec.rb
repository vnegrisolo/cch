require 'spec_helper'

RSpec.describe Cch::Setup do
  describe '.configure' do
    subject(:setup) { described_class.configure }

    it 'configures debug' do
      expect(setup.debug).to be true
    end

    it 'configures the watch_commands' do
      expect(setup.watcher_commands).to eq([
        'git diff --name-only',
        'git diff --name-only --staged',
        'git ls-files --others --exclude-standard',
        'git diff --name-only ..master'
      ])
    end

    it 'configures the runners' do
      expect(setup.runners[:rubocop]).to be_a Cch::Runner
      expect(setup.runners[:haml_lint]).to be_a Cch::Runner
      expect(setup.runners[:rspec]).to be_a Cch::Runner
    end

    it 'has the runners on' do
      expect(setup.runners[:rubocop].on).to be true
      expect(setup.runners[:haml_lint].on).to be false
      expect(setup.runners[:rspec].on).to be true
    end
  end
end
