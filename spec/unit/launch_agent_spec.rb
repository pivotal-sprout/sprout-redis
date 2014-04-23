require 'unit/spec_helper'

describe 'sprout-redis::launch_agent' do
  let(:chef_run) { ChefSpec::Runner.new }

  before do
    stub_command(/which git/)
    chef_run.converge(described_recipe)
  end

  it 'includes the install recipe' do
    expect(chef_run).to include_recipe('sprout-redis::install')
  end

  it 'creates the launch agent directory in case this is the first launch agent' do
    expect(chef_run).to create_directory('/home/fauxhai/Library/LaunchAgents').with_owner('fauxhai')
  end

  it 'copies the redis plist into the launch agents directory' do
    command = 'cp `brew --prefix redis`/homebrew.mxcl.redis.plist /home/fauxhai/Library/LaunchAgents/'
    expect(chef_run).to run_execute(command).with_user('fauxhai')
  end

  it 'loads the redis launch agent plist' do
    command = 'launchctl load -w /home/fauxhai/Library/LaunchAgents/homebrew.mxcl.redis.plist'
    expect(chef_run).to run_execute(command).with_user('fauxhai')
  end
end
