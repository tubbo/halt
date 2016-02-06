require 'spec_helper'

describe Halt do
  it 'has a version number' do
    expect(Halt::VERSION).not_to be nil
  end

  it 'does something useful' do
    expect(false).to eq(true)
  end
end
