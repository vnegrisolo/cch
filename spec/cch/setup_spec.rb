require 'spec_helper'

RSpec.describe Cch::Setup do
  describe '.configure' do
    subject(:setup) { Cch.setup }

    it 'requires gem configuration files' do
      expect(setup).to receive(:require).with('cch/config/watchers')
      expect(setup).to receive(:require).with('cch/config/runners')
      expect(setup).to receive(:load).with('Cchfile', true)
      setup.configure
    end
  end
end
