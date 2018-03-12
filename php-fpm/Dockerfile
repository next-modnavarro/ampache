FROM php:5.6-fpm

MAINTAINER MOD <navarro.mod@gmail.com>

USER root
RUN set -ex DEBIAN_FRONTEND=noninteractive \
 apt-get update && apt-get install -qyy -o APT::Install-Recommends=false -o APT::Install-Suggests=false \
  libpng12-dev libjpeg-dev zip unzip libfreetype6-dev && \
	rm -rf /var/lib/apt/lists/* && apt-get clean \
	&& docker-php-ext-install gd mysqli pdo_mysql pdo hash session \
	&& docker-php-ext-configure gd --with-png-dir=/usr --with-jpeg-dir=/usr --with-freetype-dir=/usr --enable-gd-native-ttf

USER www-data

CMD ["php-fpm"]
