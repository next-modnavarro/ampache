FROM php:5.6-fpm

MAINTAINER MOD <navarro.mod@gmail.com>

RUN set -ex DEBIAN_FRONTEND=noninteractive && \
 apt-get update && \
 apt-get install -qyy -o APT::Install-Recommends=false -o APT::Install-Suggests=false \
 git wget gettext-base && \
 wget https://raw.githubusercontent.com/composer/getcomposer.org/1b137f8bf6db3e79a38a5bc45324414a6b1f9df2/web/installer /tmp -O - -q | php -- --quiet && \
 mv composer.phar /usr/local/bin/composer && \
 wget https://github.com/ampache/ampache/archive/master.tar.gz -O - -q | tar -C /var/www/html -xvzf - && \
 mv /var/www/html/ampache-master /var/www/html/ampache && \
 chown -R www-data:www-data /var/www/ && \
 apt-get clean && \
 rm -rf /var/lib/apt/lists/*

WORKDIR /var/www/html/ampache

USER www-data

RUN composer install --prefer-source --no-interaction

WORKDIR /

ADD resources/resources.tgz /

VOLUME /var/www/html/ampache
