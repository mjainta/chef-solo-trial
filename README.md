# Overview

A demo chef-solo installation to setup my workstation using chef-solo.
As I have a workstation setup with Ansible already, I am able to compare them afterwards.

I did this to get some experience with chef-solo and see how it compares to other configuration management tools.

# Prerequisites

1. Install https://github.com/rbenv/rbenv#readme
2. Install https://github.com/rbenv/ruby-build#readme
  - The ruby version has to match chefs version
3. Install the chef workstation:
- https://docs.chef.io/workstation/install_workstation/

# Useful documentation

Good, quite up-to-date (not 100%) resources on chef in general:
- https://www.tutorialspoint.com/chef/chef_quick_guide.htm

Docs for tasks inside cookbooks:
- apt - https://docs.chef.io/resources/apt_package/
- apt repository - https://docs.chef.io/resources/apt_repository
- snap - https://docs.chef.io/resources/snap_package (Did not work for me, errors out)

Docs for Ruby:
- loops - https://code-maven.com/for-loop-in-ruby

## Chef commans

First, copy [environments/default.example.json](environments/default.example.json) into [environments/default.json](environments/default.json) and modify the placeholder values.

Run it:
```bash
sudo chef-solo -c solo.rb -j node.json
```

Generate new cookbook skeleton:
```bash
chef generate cookbook <cookbook_name>
```

# Repository Directories

This repository contains several directories, and each directory contains a README file that describes what it is for in greater detail, and how to use it for managing your systems with Chef.

- `cookbooks/` - Cookbooks you download or create.
- `data_bags/` - Store data bags and items in .json in the repository.
- `roles/` - Store roles in .rb or .json in the repository.
- `environments/` - Store environments in .rb or .json in the repository.

## Configuration

The config file, `.chef/config.rb` is a repository-specific configuration file for the knife command line tool. If you're using the Hosted Chef platform, you can download one for your organization from the management console. You can also generate a new config.rb by running `knife configure`. For more information about configuring Knife, see the Knife documentation at https://docs.chef.io/workstation/knife/
