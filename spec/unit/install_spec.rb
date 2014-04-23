require 'unit/spec_helper'

describe 'sprout-redis::install' do
  let(:runner) { ChefSpec::Runner.new }

  before do
    stub_command(/which git/)
  end

  it 'installs redis with homebrew' do
    runner.converge(described_recipe)

    expect(runner).to include_recipe('homebrew')
    expect(runner).to install_package('redis')
  end
end
