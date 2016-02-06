require 'spec_helper'

RSpec.describe Cch::VERSION do
  it 'has a version number' do
    is_expected.to eq('0.6.1')
  end
end
