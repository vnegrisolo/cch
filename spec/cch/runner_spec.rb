require 'spec_helper'

RSpec.describe Cch::Runner do
  subject(:runner) { described_class.new(:runner) }

  let(:runner_pattern) { double }

  before { runner.watch(runner_pattern) }

  describe '#run?' do
    subject { runner.run?(files) }

    context 'when files is empty' do
      let(:files) { [] }
      it { is_expected.to be false }
    end

    context 'when files has some files' do
      let(:files) { %w(f1.rb) }
      it { is_expected.to be true }
    end
  end

  describe '#run' do
    subject { runner.run(files) }

    let(:files) { %w(f1.rb f2.rb) }
    let(:filtered_files) { files }

    before do
      allow(runner).to receive(:filter_files) { filtered_files }
      allow(runner).to receive(:run?) { run? }
      allow(runner).to receive(:system_command)
    end

    context 'when the run? is false' do
      let(:run?) { false }

      it 'does not verify' do
        expect(runner).to_not receive(:system_command)
        subject
      end
    end

    context 'when the run? is true' do
      let(:run?) { true }

      it 'filters files' do
        expect(runner).to receive(:filter_files).with(files, runner_pattern => nil) { [] }
        subject
      end

      it 'verifies' do
        expect(runner).to receive(:system_command).with('bundle exec runner f1.rb f2.rb')
        subject
      end
    end
  end
end
