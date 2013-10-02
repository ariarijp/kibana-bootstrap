# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "centos63_x86_64"

  config.vm.define "web" do |web|
    web.vm.hostname = "web"
    web.vm.network :forwarded_port, guest: 80, host: 8080
  end

  config.vm.define "es01" do |es01|
    es01.vm.hostname = "es01"
    es01.vm.network :forwarded_port, guest: 9200, host: 9200
    es01.vm.network "private_network", ip: "192.168.50.101"
  end

  config.vm.define "es02" do |es02|
    es02.vm.hostname = "es02"
    es02.vm.network :forwarded_port, guest: 9200, host: 9200
    es02.vm.network "private_network", ip: "192.168.50.102"
  end


  # config.vm.network :forwarded_port, guest: 80, host: 8080
  # config.vm.network :public_network

  # config.vm.provider :virtualbox do |vb|
  #   # Don't boot with headless mode
  #   vb.gui = true
  #
  #   # Use VBoxManage to customize the VM. For example to change memory:
  #   vb.customize ["modifyvm", :id, "--memory", "1024"]
  # end
end
