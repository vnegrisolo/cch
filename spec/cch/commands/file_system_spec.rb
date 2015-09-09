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

    before do
      allow(File).to receive(:exist?).with('f1.rb') { true }
      allow(File).to receive(:exist?).with('f2.rb') { false }
      allow(File).to receive(:exist?).with('f3.txt') { true }
      allow(File).to receive(:exist?).with('texts/f3.txt') { true }
    end

    context 'when the patterns is simple filter' do
      let(:patterns) { { /\.rb$/ => nil } }

      it 'filters files' do
        is_expected.to eq(%w(f1.rb))
      end
    end

    context 'when the patterns transform files' do
      let(:patterns) { { /(.+)\.txt$/ => pattern_block } }
      let(:pattern_block) { proc { |m| %W(texts/#{m[1]}.txt) } }

      it 'filters files' do
        is_expected.to eq(%w(texts/f3.txt))
      end
    end
  end
end
