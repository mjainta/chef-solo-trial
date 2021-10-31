#
# Cookbook:: packages
# Recipe:: default
#
# Copyright:: 2021, The Authors, All Rights Reserved.
repos = [
  'ppa:shutter/ppa',
  'ppa:mikhailnov/pulseeffects',
]

packages = [
  'tilix',
  'docker-ce',
  'git',
  'tilix',
  # 'fzf', Does not exist on 18.04
  'shutter',
  'tig',
  'speedcrunch',
  'xtightvncviewer',
  'pulseeffects',
  'meld',
]

snaps = [
  'code',
  'spotify',
]

repos.each { |repo_uri|
  apt_repository 'add_repo' do
    uri repo_uri
  end
}

apt_package packages do
  action :install
end

# This does not work, fails with 'wrong number of arguments (given 1, expected 2)'
# snap_package 'install_snaps' do
#   action :install
#   package_name snaps
#   options ['classic']
# end

execute 'snap install spotify'
execute 'snap install code'

remote_file '/usr/local/bin/docker-compose' do
  source "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-#{node['kernel']['name']}-#{node['kernel']['machine']}"
  owner 'root'
  group 'root'
  mode '0755'
  action :create
end
