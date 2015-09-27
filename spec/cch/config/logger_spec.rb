require 'spec_helper'

RSpec.describe 'config/logger' do
  describe '.require' do
    subject { Cch.logger }

    before { Cch.setup.configure }

    it 'configures the logger threshold' do
      expect(subject.threshold).to eq :info
    end
  end
end
