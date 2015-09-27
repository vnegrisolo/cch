require 'spec_helper'

RSpec.describe Cch::Logger do
  subject(:logger) { described_class.new(threshold: :info, implementation: implementation) }

  let(:implementation) { double log: true }

  describe '#debug' do
    it 'does not call the logger implementation' do
      expect(implementation).to_not receive(:log)
      logger.debug('my_message')
    end
  end

  describe '#info' do
    it 'does not call the logger implementation' do
      expect(implementation).to receive(:log).with(Cch::Loggers::Level.all[:info], 'my_message')
      logger.info('my_message')
    end
  end

  describe '#error' do
    it 'does not call the logger implementation' do
      expect(implementation).to receive(:log).with(Cch::Loggers::Level.all[:error], 'my_message')
      logger.error('my_message')
    end
  end
end
