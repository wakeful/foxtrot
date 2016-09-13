# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|

  config.vm.box = "debian/contrib-jessie64"

  config.vm.hostname = "foxtrot"
  # config.ssh.pty = true

  config.vm.provider "virtualbox" do |vb|

    # vb.gui = true

    vb.cpus = 2
    vb.memory = "2048"

  end

  config.vm.provision :shell, :inline => "apt-get install -y curl"
  config.vm.provision :shell, :path => "https://raw.githubusercontent.com/wakeful/puppet-bootstrap/master/deb.sh"

  config.vm.provision :puppet do |puppet|

    puppet.environment = "dev"
    puppet.environment_path = "puppet"

  end

end
