require 'spec_helper'

RSpec.describe Cch::Commands::FileSystem do
  subject(:file_system) do
    class MyFileSystem
      include Cch::Commands::FileSystem
    end.new
  end

  describe '#filter_files' do
    subject { file_system.filter_files(files, patterns) }

    let(:files) { %w(f1.rb f2.rb f3.txt) }
    let(:patterns) { [/\.rb$/] }

    before do
      allow(File).to receive(:exist?).with('f1.rb') { true }
      allow(File).to receive(:exist?).with('f2.rb') { false }
      allow(File).to receive(:exist?).with('f3.txt') { true }
    end

    it 'filters files' do
      is_expected.to eq(%w(f1.rb))
    end
  end
end
