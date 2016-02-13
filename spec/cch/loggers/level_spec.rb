require 'spec_helper'

RSpec.describe Cch::Loggers::Level do
  describe '.all' do
    it { expect(described_class.all.keys).to eq [:debug, :info, :warning, :error] }
  end

  describe '#allowed?' do
    subject { described_class.new(:info).allowed?(threshold) }

    context 'when threshold is debug' do
      let(:threshold) { :debug }
      it { is_expected.to be true }
    end

    context 'when threshold is info' do
      let(:threshold) { :info }
      it { is_expected.to be true }
    end

    context 'when threshold is error' do
      let(:threshold) { :error }
      it { is_expected.to be false }
    end
  end

  describe '#to_s' do
    subject { described_class.new(level).to_s }

    context 'when level is debug' do
      let(:level) { :debug }
      it { is_expected.to eq('DEBUG'.color(:pink)) }
    end

    context 'when level is info' do
      let(:level) { :info }
      it { is_expected.to eq('INFO'.color(:cyan)) }
    end

    context 'when level is error' do
      let(:level) { :error }
      it { is_expected.to eq('ERROR'.color(:red)) }
    end

    context 'when level is WARN' do
      let(:level) { :WARN }
      it { is_expected.to eq('WARN'.color(:yellow)) }
    end
  end
end
