include_recipe 'sprout-redis::install'

directory "#{node['sprout']['home']}/Library/LaunchAgents" do
  owner node['current_user']
  action :create
end

execute "cp `brew --prefix redis`/homebrew.mxcl.redis.plist #{node['sprout']['home']}/Library/LaunchAgents/" do
  user node['current_user']
end

execute "launchctl load -w #{node['sprout']['home']}/Library/LaunchAgents/homebrew.mxcl.redis.plist" do
  user node['current_user']
end
