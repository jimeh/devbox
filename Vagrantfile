# Example box Hash format.
#
# {
#   :name           => :name_of_vagrant_box,             # REQUIRED
#   :ip             => '10.0.0.11',                      # REQUIRED
#   :primary        => true,
#   :hostname       => "foobar",
#   :forward_agent  => true,                             # SSH Forward Agent?
#   :box            => 'precise64',
#   :box_url        => 'http://files.vagrantup.com/precise64.box'
#   :synced_folders => {'.' => '/home/vagrant/myapp'},   # shared folder
#   :nfs_folders    => {'.' => '/home/vagrant/myapp'},   # NFS mounted foler
#   :commands       => ['touch /tmp/myfile'],
#   :vbox_config    => {'--memory' => '1536'},
#   :chef_role      => 'myrole',
#   :chef_json      => {'local' => true, 'env_name' => 'development'}
# }
#


#
# Defined Boxes
#

boxes = [
  {
    :name          => 'default',
    :primary       => true,
    :hostname      => 'devbox',
    :ip            => '3.3.3.2',
    :forward_agent => true,
    :vbox_config   => {'--memory' => '1024'},
    :chef_role     => "devbox",
    :nfs_folders   => {
      'shared/jimeh'      => '/home/jimeh',
      '~/.dotfiles'       => '/host-shared/jimeh/dotfiles',
      '~/Projects'        => '/host-shared/jimeh/projects',
      'shared/mysql_data' => '/host-shared/mysql_data'
    }
  }
]


#
# Create defined boxes
#

chef_json = {
  "local"    => true,
  "env_name" => "development"
}

Vagrant.configure("2") do |conf|
  boxes.each do |opts|
    primary = opts.key?(:primary) ? opts[:primary] : false

    conf.vm.define opts[:name], :primary => primary do |config|

      # Box basics.
      config.vm.box = opts[:box] || "precise64"
      config.vm.box_url =
        opts[:box_url] || "http://files.vagrantup.com/precise64.box"
      config.vm.hostname = opts[:hostname] if opts[:hostname]

      # Networking.
      config.vm.network :private_network, :ip => opts[:ip]
      config.ssh.forward_agent =
        opts.key?(:forward_agent) ? opts[:forward_agent] : true

      # Synced folders.
      (opts[:synced_folders] || {}).each do |host_dir, client_dir|
        config.vm.synced_folder host_dir, client_dir
      end

      # NFS Synced folders.
      (opts[:nfs_folders] || {}).each do |host_dir, client_dir|
        config.vm.synced_folder host_dir, client_dir, :nfs => true
      end

      # VirtualBox customizations.
      config.vm.provider :virtualbox do |vb|
        (opts[:vbox_config] || {}).each do |name, value|
          vb.customize ['modifyvm', :id, name, value]
        end
      end

      # Use a more recent version of Chef.
      config.vm.provision :shell, :inline =>
        "gem install chef -v 11.6.0 --no-rdoc --no-ri --conservative;" +
        "gem install ruby-shadow -v 2.2.0 --no-rdoc --no-ri --conservative"

      # Run shell commands for box.
      (opts[:commands] || {}).each do |command|
        config.vm.provision :shell, :inline => command
      end

      # Configure the box with Chef.
      config.vm.provision :chef_solo do |chef|
        # Set paths to local Chef resources.
        chef.data_bags_path = "data_bags"
        chef.cookbooks_path = ["cookbooks", "site-cookbooks"]
        chef.roles_path     = "roles"

        # Add a Chef role if specified.
        chef.add_role opts[:chef_role] unless opts[:chef_role].nil?

        # Merge the general Chef JSON with box-specific JSON.
        chef.json = chef_json.merge(opts[:chef_json] || {})
      end

    end # conf.vm.define
  end # boxes.each
end # Vagrant.configure
