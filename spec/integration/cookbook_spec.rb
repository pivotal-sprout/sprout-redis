require 'spec_helper'

describe 'sprout-redis' do
  before :all do
    expect(File).to_not be_exist('/usr/local/bin/redis-cli')
    expect(system('soloist')).to be_true
  end

  it 'installs redis' do
    expect(File).to be_exist('/usr/local/bin/redis-cli')
  end

  it 'starts redis' do
    expect {
      TCPSocket.open('localhost', 6379).close
    }.not_to raise_error

    expect(system('psql -c "select 1" &> /dev/null')).to be_true
  end
end
