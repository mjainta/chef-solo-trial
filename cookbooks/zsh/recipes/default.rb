#
# Cookbook:: zsh
# Recipe:: default
#
# Copyright:: 2021, The Authors, All Rights Reserved.

git "/home/#{node['user']['name']}/.oh-my-zsh" do
  repository 'https://github.com/ohmyzsh/ohmyzsh.git'
  revision 'master'
  action :sync
end

template "/home/#{node['user']['name']}/.zshrc" do
  source '.zshrc'
  owner node['user']['name']
  group node['user']['name']
  mode '0644'
end

template "/home/#{node['user']['name']}/.oh-my-zsh/custom/maj_aliases.zsh" do
  source 'custom/maj_aliases.zsh'
  owner node['user']['name']
  group node['user']['name']
  mode '0644'
end

template "/home/#{node['user']['name']}/.p10k.zsh" do
  source '.p10k.zsh'
  owner node['user']['name']
  group node['user']['name']
  mode '0644'
end

git "/home/#{node['user']['name']}/.oh-my-zsh/custom/themes/powerlevel10k" do
  repository 'https://github.com/romkatv/powerlevel10k.git'
  revision 'master'
  action :sync
end

ruby_block 'Setup default shell on company workstation' do
  block do
    fe = Chef::Util::FileEdit.new('/etc/sssd/sssd.conf')
    fe.search_file_replace_line(%r{^default_shell = /bin/bash$}, 'default_shell = /usr/bin/zsh')
    fe.write_file
  end
  not_if { !File.exist?('/etc/sssd/sssd.conf') }
end

user node['user']['name'] do
  shell '/usr/bin/zsh'
  not_if { File.exist?('/etc/sssd/sssd.conf') }
  action :modify
end
