box      = "precise64"
url      = "http://files.vagrantup.com/precise64.box"
hostname = "devbox"
ram      = "1024"

Vagrant.configure("2") do |config|
  config.vm.box     = box
  config.vm.box_url = url

  config.vm.network :private_network, :ip => "192.168.50.61"

  config.vm.hostname = hostname
  config.ssh.forward_agent = true

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  # config.vm.network :forwarded_port, guest: 80, host: 9080

  config.vm.synced_folder "shared/jimeh", "/home/jimeh",                 :nfs => true
  config.vm.synced_folder "~/.dotfiles",  "/host-shared/jimeh/dotfiles", :nfs => true
  config.vm.synced_folder "~/Projects",   "/host-shared/jimeh/projects", :nfs => true

  config.vm.provider :virtualbox do |vb|
    # Use VBoxManage to customize the VM. For example to change memory:
    vb.customize ["modifyvm", :id,
      "--memory", ram
    ]
  end

  config.omnibus.chef_version = "11.6.0"

  config.vm.provision :chef_solo do |chef|
    chef.data_bags_path = "data_bags"
    chef.cookbooks_path = ["cookbooks", "site-cookbooks"]

    chef.add_recipe "jimeh::devbox"
  end

end
