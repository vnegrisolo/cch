require 'spec_helper'

RSpec.describe Cch::Setup do
  describe '.config' do
    subject(:setup) { described_class.config }

    it 'configures debug' do
      expect(setup['debug']).to be true
    end
  end
end
