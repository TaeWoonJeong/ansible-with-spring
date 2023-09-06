# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |config|
  #Ansible-Node101
  config.vm.define "ansible-node101" do |cfg|
    cfg.vm.box = "centos/7"
    cfg.vm.provider "virtualbox" do |vb|
      vb.name = "Ansible-Node101"
    end
    cfg.vm.host_name = "ansible-node101"
    cfg.vm.network "public_network", ip: "192.168.219.101", bridge: "Hyper-V Virtual Ethernet Adapter"
    cfg.vm.network "forwarded_port", guest: 22, host:60101, auto_correct: true, id: "ssh"
    cfg.vm.network "forwarded_port", guest: 80, host:8101, auto_correct: true, id: "nginx"
    cfg.vm.synced_folder "../data", "/vagrant", disabled: true
    cfg.vm.provision "shell", path: "./init/bash_ssh_conf_CentOS.sh"
    cfg.vbguest.auto_update = false
  end

  #Ansible-Node102
  config.vm.define "ansible-node102" do |cfg|
    cfg.vm.box = "centos/7"
    cfg.vm.provider "virtualbox" do |vb|
      vb.name = "Ansible-Node102"
    end
    cfg.vm.host_name = "ansible-node102"
    cfg.vm.network "public_network", ip: "192.168.219.102", bridge: "Hyper-V Virtual Ethernet Adapter"
    cfg.vm.network "forwarded_port", guest: 22, host:60102, auto_correct: true, id: "ssh"
    cfg.vm.network "forwarded_port", guest: 80, host:8102, auto_correct: true, id: "nginx"
    cfg.vm.synced_folder "../data", "/vagrant", disabled: true
    cfg.vm.provision "shell", path: "./init/bash_ssh_conf_CentOS.sh"
    cfg.vbguest.auto_update = false
  end

  #Ansible-Node201
  config.vm.define "ansible-node201" do |cfg|
    cfg.vm.box = "bento/ubuntu-20.04"
    cfg.vm.provider "virtualbox" do |vb|
      vb.name = "Ansible-Node201"
    end
    cfg.vm.host_name = "ansible-node201"
    cfg.vm.network "public_network", ip: "192.168.219.201", bridge: "Hyper-V Virtual Ethernet Adapter"
    cfg.vm.network "forwarded_port", guest: 22, host:60201, auto_correct: true, id: "ssh"
    cfg.vm.network "forwarded_port", guest: 80, host:8201, auto_correct: true, id: "nginx"
    cfg.vm.synced_folder "../data", "/vagrant", disabled: true
    cfg.vbguest.auto_update = false
    cfg.vm.provision "shell", inline: "ln -s /usr/bin/python3 /usr/bin/python || true"
    cfg.vm.provision "shell", path: "./init/bash_ssh_passwd_conf_Ubuntu.sh"
  end

  #Ansible-Node202
  config.vm.define "ansible-node202" do |cfg|
    cfg.vm.box = "bento/ubuntu-20.04"
    cfg.vm.provider "virtualbox" do |vb|
      vb.name = "Ansible-Node202"
    end
    cfg.vm.host_name = "ansible-node202"
    cfg.vm.network "public_network", ip: "192.168.219.202", bridge: "Hyper-V Virtual Ethernet Adapter"
    cfg.vm.network "forwarded_port", guest: 22, host:60202, auto_correct: true, id: "ssh"
    cfg.vm.network "forwarded_port", guest: 80, host:8202, auto_correct: true, id: "nginx"
    cfg.vm.synced_folder "../data", "/vagrant", disabled: true
    cfg.vbguest.auto_update = false
    cfg.vm.provision "shell", inline: "ln -s /usr/bin/python3 /usr/bin/python || true"
    cfg.vm.provision "shell", path: "./init/bash_ssh_passwd_conf_Ubuntu.sh"
  end

  #Ansible-DB
  config.vm.define "ansible-db" do |cfg|
    cfg.vm.box = "centos/7"
    cfg.vm.provider "virtualbox" do |vb|
      vb.name = "Ansible-DB"
    end
    cfg.vm.host_name = "ansible-db"
    cfg.vm.network "public_network", ip: "192.168.219.150", bridge: "Hyper-V Virtual Ethernet Adapter"
    cfg.vm.network "forwarded_port", guest: 22, host:60301, auto_correct: true, id: "ssh"
    cfg.vm.synced_folder "../data", "/vagrant", disabled: true
    cfg.vm.provision "shell", path: "./init/bash_ssh_conf_CentOS.sh"
    cfg.vbguest.auto_update = false
  end

  #Ansible-Server
  config.vm.define "ansible-server" do |cfg|
    cfg.vm.box = "centos/7"
    cfg.vm.provider "virtualbox" do |vb|
      vb.name = "Ansible-Server"
    end
    cfg.vm.host_name = "ansible-server"
    cfg.vm.network "public_network", ip: "192.168.219.10", bridge: "Hyper-V Virtual Ethernet Adapter"
    cfg.vm.network "forwarded_port", guest:22, host:60010, auto_correct: true, id: "ssh"
    cfg.vm.synced_folder "../data", disabled: true
    cfg.vbguest.auto_update = false
    cfg.vm.provision "shell", inline: "yum install epel-release -y"
    cfg.vm.provision "shell", inline: "yum install ansible -y"
    cfg.vm.provision "file", source: "./db",
      destination: "./db"
    cfg.vm.provision "file", source: "./init",
      destination: "./init"
    cfg.vm.provision "file", source: "./java",
      destination: "./java"
    cfg.vm.provision "file", source: "./nginx",
      destination: "./nginx"
    cfg.vm.provision "file", source: "./spring",
      destination: "./spring"

    cfg.vm.provision "shell", inline: "ansible-playbook ./init/ansible-server.yml"
    cfg.vm.provision "shell", inline: "ansible-playbook ./init/auto-pass.yml", privileged: false
    cfg.vm.provision "shell", inline: "ansible-playbook ./db/db.yml", privileged: false
    cfg.vm.provision "shell", inline: "ansible-playbook ./java/java-install.yml", privileged: false
    cfg.vm.provision "shell", inline: "ansible-playbook ./nginx/nginx-install.yml", privileged: false
    cfg.vm.provision "shell", inline: "ansible-playbook ./spring/send-spring-run.yml", privileged: false
  end
end
