require 'unit/spec_helper'

describe 'sprout-redis::default' do
  let(:runner) { ChefSpec::Runner.new }

  before do
    stub_command(/which git/)
  end

  it 'includes the install recipe' do
    runner.converge(described_recipe)
    expect(runner).to include_recipe('sprout-redis::install')
  end

  it 'includes the add_launch_agent recipe' do
    runner.converge(described_recipe)
    expect(runner).to include_recipe('sprout-redis::launch_agent')
  end
end
