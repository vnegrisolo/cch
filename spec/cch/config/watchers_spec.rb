require 'spec_helper'

RSpec.describe 'config/watchers' do
  describe '.require' do
    subject { Cch::Watcher }

    before { Cch.setup.configure }

    it 'configures the watcher commands' do
      expect(subject.commands).to eq([
                                       'git diff --name-only',
                                       'git diff --name-only --staged',
                                       'git ls-files --others --exclude-standard',
                                       'git diff --name-only ..master'
                                     ])
    end
  end
end
