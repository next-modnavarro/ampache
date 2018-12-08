FROM php:7

MAINTAINER MOD <navarro.mod@gmail.com>

ARG AMPACHE_VERSION=4.0.0-pre-release

RUN set -ex DEBIAN_FRONTEND=noninteractive && \
 apt-get update && \
 apt-get install -qyy -o APT::Install-Recommends=false -o APT::Install-Suggests=false git libgd3 libjpeg62-turbo-dev  libpng-dev libfreetype6-dev libgmp10-dev && \
 docker-php-ext-configure gd --with-png-dir=/usr --with-jpeg-dir=/usr --with-freetype-dir=/usr --enable-gd-native-ttf && \
 docker-php-ext-install gd && \
 docker-php-ext-configure gmp && \
 docker-php-ext-install gmp

ADD https://raw.githubusercontent.com/composer/getcomposer.org/1b137f8bf6db3e79a38a5bc45324414a6b1f9df2/web/installer /tmp/

WORKDIR /tmp

RUN php installer --quiet

RUN mv composer.phar /usr/local/bin/composer

ADD https://github.com/ampache/ampache/archive/${AMPACHE_VERSION}.tar.gz /tmp/

RUN tar -C /usr/src/ -xvf /tmp/${AMPACHE_VERSION}.tar.gz  && \
 mv /usr/src/ampache-${AMPACHE_VERSION}/ /usr/src/ampache && \
 chown -R www-data:www-data /usr/src/ && \
 apt-get clean && \
 rm -rf /var/lib/apt/lists/* && \
 rm -rf /tmp/*

WORKDIR /usr/src/ampache

USER www-data

RUN composer install --prefer-source --no-interaction

WORKDIR /

ADD resources/resources.tgz /

VOLUME /usr/src/ampache
