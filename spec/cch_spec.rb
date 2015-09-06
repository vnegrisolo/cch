require 'spec_helper'

RSpec.describe Cch do
  describe '.run' do
    subject { described_class.run(args) }

    let(:args) { [] }
    let(:watcher) { double files: files }
    let(:files) { %w(f1.rb f2.rb) }

    before do
      allow(Cch::Watcher).to receive(:new) { watcher }
    end

    it 'invokes the watcher' do
      expect(watcher).to receive(:files)
      subject
    end
  end
end
