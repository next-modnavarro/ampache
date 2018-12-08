FROM php:7

MAINTAINER MOD <navarro.mod@gmail.com>

ARG AMPACHE_VERSION=4.0.0-pre-release

RUN set -ex DEBIAN_FRONTEND=noninteractive && \
 apt-get update && \
 apt-get install -qyy -o APT::Install-Recommends=false -o APT::Install-Suggests=false \
 git wget gettext-base && \
 wget https://raw.githubusercontent.com/composer/getcomposer.org/1b137f8bf6db3e79a38a5bc45324414a6b1f9df2/web/installer /tmp -O - -q | php -- --quiet && \
 mv composer.phar /usr/local/bin/composer && \
 wget https://github.com/ampache/ampache/archive/${AMPACHE_VERSION}.tar.gz -O - -q | tar -C /usr/src/ -xvzf - && \
 mv /usr/src/ampache-${AMPACHE_VERSION} /usr/src/ampache && \
 chown -R www-data:www-data /usr/src/ && \
 apt-get clean && \
 rm -rf /var/lib/apt/lists/*

WORKDIR /usr/src/ampache

USER www-data

RUN composer install --prefer-source --no-interaction

WORKDIR /

ADD resources/resources.tgz /

VOLUME /usr/src/ampache
