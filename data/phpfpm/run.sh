!/bin/sh

chown -R www-data:wwww-data /var/www/html

# if [ ! -d /DATA/htdocs ] ; then
#   mkdir -p /DATA/htdocs
# fi


# # start php-fpm
# mkdir -p /DATA/logs/php-fpm
# # start nginx
# mkdir -p /DATA/logs/nginx
# mkdir -p /tmp/nginx
# chown nginx:nginx /tmp/nginx
# chown -R nginx:nginx /DATA

# if [ ! -d /DATA/bin ] ; then
#   mkdir /DATA/bin
#   chown nginx:nginx /DATA/bin
#   # cp /usr/bin/wp /DATA/bin/wp

#   curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
#   chmod +x wp-cli.phar 
#   mv wp-cli.phar /DATA/bin/wp 
# fi
nginx
php-fpm