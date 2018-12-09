FROM php:7.2-fpm

MAINTAINER MOD <navarro.mod@gmail.com>

ARG AMPACHE_VERSION=laravel

RUN set -ex DEBIAN_FRONTEND=noninteractive && \
 apt-get update && \
 apt-get install -qyy -o APT::Install-Recommends=false -o APT::Install-Suggests=false git gettext-base libgd3 libjpeg62-turbo-dev  libpng-dev libfreetype6-dev libgmp10-dev && \
 docker-php-ext-configure gd --with-png-dir=/usr --with-jpeg-dir=/usr --with-freetype-dir=/usr --enable-gd-native-ttf && \
 docker-php-ext-install gd && \
 docker-php-ext-configure gmp && \
 docker-php-ext-install gmp && \
 apt-get clean && \
 rm -rf /var/lib/apt/lists/*

ADD https://raw.githubusercontent.com/composer/getcomposer.org/1b137f8bf6db3e79a38a5bc45324414a6b1f9df2/web/installer /tmp/

WORKDIR /tmp

RUN set -ex DEBIAN_FRONTEND=noninteractive && \
    php installer --quiet && \
    mv composer.phar /usr/local/bin/composer && \
    git clone https://github.com/ampache/ampache.git --branch ${AMPACHE_VERSION} /usr/src/ampache && \
    chown -R www-data:www-data /usr/src/ && \
    rm -rf /tmp/*

WORKDIR /usr/src/ampache

USER www-data

RUN composer install --prefer-source --no-interaction

RUN php

WORKDIR /

ADD resources/resources.tgz /

VOLUME /usr/src/ampache
