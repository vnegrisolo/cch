require 'spec_helper'

RSpec.describe Cch::Commands::Shell do
  subject(:shell) do
    class MyShell
      include Cch::Commands::Shell
    end.new
  end

  let(:command) { 'my_shell_command' }

  describe '#backtiq_command' do
    subject { shell.backtiq_command(command) }

    before { allow(shell).to receive(:`) { result } }

    context 'when the command returns two files' do
      let(:result) { "f1\nf2" }
      it { is_expected.to eq(%w(f1 f2)) }
    end

    context 'when the command returns nil' do
      let(:result) { nil }
      it { is_expected.to eq([]) }
    end

    context 'when the command returns empty string' do
      let(:result) { '' }
      it { is_expected.to eq([]) }
    end
  end

  describe '#system_command' do
    subject { shell.system_command(command) }

    it 'calls the system command' do
      expect(shell).to receive(:system).with(command)
      subject
    end
  end
end
