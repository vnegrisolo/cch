require 'spec_helper'

RSpec.describe Cch::VERSION do
  it 'has a version number' do
    is_expected.to eq('0.4.0')
  end
end
