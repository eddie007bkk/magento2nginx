# Magento2nginx

This project is build docker images for Magento2 that useing nginx and php-fpm.
Not only local enviroment but also build Multi-binary for Japan,Korea,China and Russia charactors.

Memo: Do NOT use 'docker for macintosh'. mac os file system and docker share holder is really slow.
I strongly recommend use VirtualBox and Vagrant launch linux(CentOS etc.) for Docker base.

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
    v.cpus = 4
  end
  #
  # Make Docker available on the VM from the beginning
  #  
  config.vm.provision "docker"

  # Port forwarding to the host side so that you can browse the web screen and phpMyAdmin
  config.vm.network "private_network", ip: "172.12.8.150"
  config.vm.network "forwarded_port", host: 80, guest: 80 # Magento
  config.vm.network "forwarded_port", host: 8085, guest: 8085 # phpMyAdmin
  #
  # Share your project folder which has docker-compose.yml to vagrant home folder
  # ( Edit home dir for your enviroment. )
  config.vm.synced_folder "/Users/sakai/dev/magento2nginx", "/home/vagrant/magento2nginx", type: "nfs"
end
---
##
## How to use
##
$ vagrant up
$ vagrant ssh

# download newest Docker Compose
# Change `1.17.1` for the version (Check https://github.com/docker/compose/releases)
$ sudo curl -L https://github.com/docker/compose/releases/download/1.25.0/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose

# set permission for runnnig binary
$ sudo chmod +x /usr/local/bin/docker-compose

[vagrant@localhost ~]$ docker-compose up
```

# Environment

* Magento2.3
* PHP7.3
  # php.ini ( Edit for your timezone )
  date.timezone = Aisa/Tokyo
* MySql5.7
* phpMyAdmin4.9
* Docker
  # docker-compose.yml ( Edit for your timezone )
      environment:
        TZ: "Asia/Tokyo"

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


docker-compose down
vagrant halt
bye!!!

# License

MIT License.
See [LICENSE](LICENSE).

