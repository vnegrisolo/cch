require 'spec_helper'

RSpec.describe Cch::Loggers::Stdout do
  describe '#log' do
    subject(:logger) { described_class.new.log(level, 'my_message', time) }

    let(:level) { Cch::Loggers::Level.new(:debug) }
    let(:time) { Time.new }

    it 'has a timestamp' do
      is_expected.to include("[#{time}]")
    end

    it 'has the message' do
      is_expected.to include(' - my_message')
    end

    it 'has the level' do
      is_expected.to include('DEBUG')
    end
  end
end
