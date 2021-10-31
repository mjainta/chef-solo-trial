#
# Cookbook:: gitconfig
# Recipe:: default
#
# Copyright:: 2021, The Authors, All Rights Reserved.

log "#{node['user']}" do
  level :info
end

template "/home/#{node['user']['name']}/.gitconfig" do
  source 'gitconfig.erb'
  owner node['user']['name']
  group node['user']['name']
  mode '0644'
  variables(git_email: node['user']['email'])
end
