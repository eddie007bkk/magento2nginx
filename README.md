# Magento2nginx

This project is build docker images for Magento2 that useing nginx and php-fpm.
Not only local enviroment but also build Multi-binary for Asia charactors.

# Required

* Docker for Mac

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
docker exec -it nginx /bin/sh

# install composer
curl -sS https://getcomposer.org/installer -o composer-setup.php
php composer-setup.php --install-dir=/usr/local/bin --filename=composer

# install magento ( you have to get account at magento.com )
composer create-project --repository-url=https://repo.magento.com/ magento/project-community-edition /var/www/html/magento
Username: [YOUR-PUBLIC-KEY]
Password: [YOUR-PRIVATE-KEY]

```

# License

MIT License.
See [LICENSE](LICENSE).

