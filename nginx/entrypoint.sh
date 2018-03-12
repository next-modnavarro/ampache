#!/bin/bash

envsubst  '${AMPACHE_DOMAIN} ${SRC_PATH}' < /etc/nginx/conf.d/nginx.conf.template > /etc/nginx/conf.d/default.conf 

exec nginx -g 'daemon off;'
