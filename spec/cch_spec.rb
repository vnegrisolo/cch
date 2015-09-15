require 'spec_helper'

RSpec.describe Cch do
  describe '.run' do
    subject { described_class.run(args) }

    let(:args) { [] }
    let(:files) { %w(f1.rb f2.rb) }
    let(:runners) { [] }

    before do
      allow(Cch::Setup).to receive(:configure)
      allow(Cch::Watcher).to receive(:files) { files }
      allow(Cch::Runner).to receive(:where) { runners }
      subject
    end

    it 'configures the setup' do
      expect(Cch::Setup).to have_received(:configure)
    end

    it 'calls the watcher' do
      expect(Cch::Watcher).to have_received(:files)
    end

    context 'when there are no specific runners to call' do
      let(:args) { [] }

      it 'fetches all the runners' do
        expect(Cch::Runner).to have_received(:where).with(on?: true)
      end
    end

    context 'when there are specific runners to call' do
      let(:args) { %w(rubocop rspec) }

      it 'fetches the runners filtering by names' do
        expect(Cch::Runner).to have_received(:where).with(on?: true, name: %w(rubocop rspec))
      end
    end

    context 'when there are some runner to call' do
      let(:runners) { [runner] }
      let(:runner) { double run: true }

      it 'calls the runner' do
        expect(runner).to have_received(:run).with(files)
      end
    end
  end
end
