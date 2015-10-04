require 'spec_helper'

RSpec.describe Cch::Runner do
  subject(:runner) { described_class.new(:foo_runner) }

  describe '.where' do
    subject { described_class.where(options) }

    let(:foo_runner) { double 'foo', on: true, name: :foo }
    let(:bar_runner) { double 'bar', on: false, name: :bar }

    before { allow(described_class).to receive(:all) { [foo_runner, bar_runner] } }

    context 'when filtering by on?' do
      let(:options) { { on?: true } }

      it { is_expected.to eq [foo_runner] }
    end

    context 'when filtering by name' do
      let(:options) { { name: :bar } }

      it { is_expected.to eq [bar_runner] }
    end
  end

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

    let(:runner_pattern) { double }

    before { runner.watch(runner_pattern) }

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
        expect(runner).to receive(:system_command).with('bundle exec foo_runner f1.rb f2.rb')
        subject
      end
    end
  end
end
