# Magento2nginx

This project is build docker images for Magento2 that useing nginx and php-fpm.
Not only local enviroment but also build Multi-binary for Asia charactors.

# Required

* virtualbox
https://www.virtualbox.org/

* Vagrant
https://www.vagrantup.com/

```
$ vagrant box add centos/7

1) hyperv
2) libvirt
3) virtualbox
4) vmware_desktop

Enter your choice: 3

$ vagrant box list
$ mkdir -p  ~/vagrant
$ cd ~/vagrant
$ vagrant init centos/7

$ vi Vagrantfile
----
Vagrant.configure("2") do |config|
  config.vm.box = "centos/7"

  # Up to memory 8G Byte
  config.vm.provider "virtualbox" do |v|
    v.memory = 8192
    v.cpus = 2
  end

  # Make Docker available on the VM from the beginning
  config.vm.provision "docker"

  # Port forwarding to the host side so that you can browse the web screen and phpMyAdmin
  config.vm.network "private_network", ip: "172.12.8.150"
  config.vm.network "forwarded_port", host: 80, guest: 80 # Magento
  config.vm.network "forwarded_port", host: 8085, guest: 8085 # phpMyAdmin

  # Share files such as docker-compose.yml on the host side for reference in the VM
  config.vm.synced_folder "/Users/sakai/dev", "/home/vagrant/dev", type: "nfs"
end
---
$ vagrant up
$ vagrant ssh
[vagrant@localhost ~]$ cd dev
```

# Environment

* Magento2.3
* PHP7.3
* MySql5.7
* phpMyAdmin4.9

# How To Run

```bash
# Build and run your container
docker-compose up

# Open other ssh window
＃ List up your runnig container
docker ps

# ssh login to php container
docker exec -it phpfpm /bin/sh

# install composer
curl -sS https://getcomposer.org/installer -o composer-setup.php
php composer-setup.php --install-dir=/usr/local/bin --filename=composer

# install magento ( you have to get account at magento.com )
composer create-project --repository-url=https://repo.magento.com/ magento/project-community-edition /var/www/html/magento
Username: [YOUR-PUBLIC-KEY]
Password: [YOUR-PRIVATE-KEY]

chmod -R 777 /var/www/html

```



CREATE DATABASE magento DEFAULT CHARACTER SET utf8mb4;

host: mysql
ID: root
PW: password


# install cron
php bin/magento cron:install
# make sure
crontab -e

php bin/magento indexer:reindex

# download sample data
php bin/magento sampledata:deploy
# Setup sample data
php bin/magento setup:upgrade

# License

MIT License.
See [LICENSE](LICENSE).

