FROM php:7.2.4-fpm-alpine

LABEL maintainer="Y.Sakai @ Bluemoon inc."

ADD     http://downloads3.ioncube.com/loader_downloads/ioncube_loaders_lin_x86-64.tar.gz /tmp/

RUN     apk update                       && \
        \
        apk upgrade                      && \
        \
        docker-php-source extract        && \
        \
        apk add --no-cache                  \
            --virtual .build-dependencies   \
                $PHPIZE_DEPS                \
                zlib-dev                    \
                cyrus-sasl-dev              \
                git                         \
                autoconf                    \
                g++                         \
                libtool                     \
                make                        \
                automake                    \
                pcre-dev                 && \
        \
        apk add --no-cache                  \
            gettext                         \
            tini                            \
            libintl                         \
            icu                             \
            icu-dev                         \
            libxml2-dev                     \
            freetype-dev                    \
            libjpeg-turbo-dev               \
            libpng-dev                      \
            gmp                             \
            gmp-dev                         \
            libmemcached-dev                \
            imagemagick-dev                 \
            libssh2                         \
            libssh2-dev                     \
            libxslt-dev

RUN set -x && \
  apk add --no-cache icu-libs && \
  apk add --no-cache --virtual build-dependencies && \
  NPROC=$(grep -c ^processor /proc/cpuinfo 2>/dev/null || 1) && \
  docker-php-ext-configure pdo_oci --with-pdo-oci=instantclient,/opt/oracle/instantclient_12_1,12.1 && \
  docker-php-ext-install -j${NPROC} intl && \
  docker-php-ext-install -j${NPROC} mysqli && \
  docker-php-ext-install -j${NPROC} pdo_mysql && \
  docker-php-ext-install -j${NPROC} pdo && \
  docker-php-ext-install -j${NPROC} mbstring && \
  docker-php-ext-enable oci8 && \
  apk del --no-cache --purge build-dependencies && \
  rm -rf /tmp/pear


## For ZIP and SSH
RUN wget "https://github.com/Sean-Der/pecl-networking-ssh2/archive/php7.zip" \
    && unzip php7.zip \
    && cd pecl-networking-ssh2-php7 \
    && phpize \
    && ./configure \
    && make && make install \
    && docker-php-ext-enable ssh2

## set user
RUN set -x && \
  deluser www-data && \
  addgroup -g 50 -S www-data && \
  adduser -u 1000 -D -S -G www-data www-data
VOLUME /etc/tnsnames.ora