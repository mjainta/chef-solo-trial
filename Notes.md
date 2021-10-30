# Prerequisites

Good, quite up-to-date (not 100% ) resources:
* https://www.tutorialspoint.com/chef/chef_quick_guide.htm

Install https://github.com/rbenv/rbenv#readme
Install https://github.com/rbenv/ruby-build#readme
* The ruby version has to match chefs version

Install the chef workstation:
* https://docs.chef.io/workstation/install_workstation/

## Chef commands

Run it:
```bash
sudo chef-solo -c solo.rb -j node.json
```

Generate new cookbook skeleton:
```bash
chef generate cookbook <cookbook_name>
```

## Docs for tasks inside cookbooks

* apt - https://docs.chef.io/resources/apt_package/
* apt repository - https://docs.chef.io/resources/apt_repository
* snap - https://docs.chef.io/resources/snap_package (Did not work for me, errors out)


## Docs for Ruby

* loops - https://code-maven.com/for-loop-in-ruby
