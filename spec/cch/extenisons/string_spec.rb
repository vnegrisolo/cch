require 'spec_helper'

RSpec.describe String do
  subject(:string) { 'my-string' }

  it { expect(string.color(:yellow)).to eq("\e[33m\e[48m#{string}\e[0m") }
  it { expect(string.color(:black, :green)).to eq("\e[30m\e[42m#{string}\e[0m") }
end
