require 'spec_helper'

RSpec.describe Cch do
  describe '.run' do
    subject { described_class.run(args) }

    let(:args) { [] }
    let(:watcher) { double files: files }
    let(:files) { %w(f1.rb f2.rb) }
    let(:runners) { { runner: runner_runner } }
    let(:runner_runner) { double on: true, run: true }

    before do
      allow(Cch::Setup).to receive(:configure)
      allow(Cch::Watcher).to receive(:new) { watcher }
      allow(Cch::Setup).to receive(:runners) { runners }
    end

    it 'configure the setup' do
      expect(Cch::Setup).to receive(:configure)
      subject
    end

    it 'calls the watcher' do
      expect(watcher).to receive(:files)
      subject
    end

    it 'calls the runners' do
      expect(runner_runner).to receive(:run).with(files)
      subject
    end
  end
end
