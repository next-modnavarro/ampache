FROM nginx:1.10

MAINTAINER MOD <navarro.mod@gmail.com>

RUN rm /etc/nginx/conf.d/default.conf

COPY nginx.conf /etc/nginx/nginx.conf

COPY nginx.conf.template /etc/nginx/conf.d/nginx.conf.template

COPY entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh
