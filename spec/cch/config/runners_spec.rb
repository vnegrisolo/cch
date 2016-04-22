require 'spec_helper'

RSpec.describe 'config/runners' do
  describe '.require' do
    subject { Cch::Runner }

    before { Cch.setup.configure }

    it 'configures the runners' do
      expect(subject.runners[:rubocop]).to be_a Cch::Runner
      expect(subject.runners[:haml_lint]).to be_a Cch::Runner
      expect(subject.runners[:rspec]).to be_a Cch::Runner
      expect(subject.runners[:cucumber]).to be_a Cch::Runner
    end

    it 'has the runners on' do
      expect(subject.runners[:rubocop].on).to be true
      expect(subject.runners[:haml_lint].on).to be false
      expect(subject.runners[:rspec].on).to be true
      expect(subject.runners[:cucumber].on).to be false
    end
  end
end
