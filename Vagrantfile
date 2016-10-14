# -*- mode: ruby -*-
# If you are using Virtualbox, please make sure you have the vbguest plugin installed.

Vagrant.configure("2") do |config|
  config.vm.hostname = 'orangescrum'
  config.vm.box = "fedora/24-cloud-base"

  config.vm.network "forwarded_port", guest: 80, host: 8080

  config.vm.provision :salt do |salt|
    salt.masterless = true
    salt.minion_id = 'orangescrum'
    salt.run_highstate = true
  end

  config.vm.synced_folder "./", "/vagrant", { nfs: true }
  config.vm.synced_folder "salt", "/srv/salt", { nfs: true }

  config.vm.provider :libvirt do |libvirt|
    libvirt.memory = 1024
    libvirt.cpus = 1
  end
end
