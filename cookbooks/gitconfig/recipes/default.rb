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
  
  # - name: Install golang
  #   ansible.builtin.unarchive:
  #     src: https://golang.org/dl/go1.17.2.linux-amd64.tar.gz
  #     dest: /usr/local
  #     remote_src: yes
  #     creates: /usr/local/go
  #   become: yes
  #   become_method: sudo
  
  # - name:
  #   ansible.builtin.template:
  #     src: .gitconfig
  #     dest: ~/.gitconfig
  
  # - name: Install ghq
  #   command: go install github.com/x-motemen/ghq@latest
  