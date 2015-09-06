require 'spec_helper'

RSpec.describe Cch::Watcher do
  let(:watcher) { described_class.new(commands) }
  let(:commands) { [git_status, git_diff] }
  let(:git_status) { 'git status' }
  let(:git_diff) { 'git diff' }

  describe '#files' do
    subject { watcher.files }

    before { allow(watcher).to receive(:backtiq_command) { files } }

    it 'call all the watcher commands' do
      expect(watcher).to receive(:backtiq_command).with(git_status) { %w(f1 f3 f2) }
      expect(watcher).to receive(:backtiq_command).with(git_diff) { %w(f1) }

      is_expected.to eq(%w(f1 f2 f3))
    end

    context 'when the command returns two files in order' do
      let(:files) { %w(f1 f2) }
      it { is_expected.to eq(%w(f1 f2)) }
    end

    context 'when the command returns two files in reverse order' do
      let(:files) { %w(f2 f1) }
      it { is_expected.to eq(%w(f1 f2)) }
    end

    context 'when the command returns one file and a nil value' do
      let(:files) { %w(f1) << nil }
      it { is_expected.to eq(%w(f1)) }
    end

    context 'when the command returns duplicated files' do
      let(:files) { %w(f1 f1) }
      it { is_expected.to eq(%w(f1)) }
    end

    context 'when the command returns empty array' do
      let(:files) { [] }
      it { is_expected.to eq([]) }
    end
  end
end
