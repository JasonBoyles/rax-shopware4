# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure('2') do |config|
  config.vm.hostname = 'rax-shopware4'
  config.vm.box = 'ubuntu-12.04'
  config.vm.box_url = "http://opscode-vm-bento.s3.amazonaws.com/vagrant/virtualbox/opscode_#{config.vm.box}_chef-provisionerless.box"
  config.omnibus.chef_version = 'latest'
  config.berkshelf.enabled = true

  config.vm.provision "shell", inline: "apt-get update && apt-get install build-essential"

  config.vm.provision :chef_solo do |chef|
#    chef.cookbooks_path = [ '.' ]
    chef.json = {
    }

    chef.run_list = [
        'recipe[rax-shopware4::default]'
    ]
  end
end
