FROM alpine:3.7

MAINTAINER MOD <navarro.mod@gmail.com>

RUN apk -Uu add bash tzdata groff less python py-pip

RUN \
	mkdir -p /aws && \
	pip install awscli && \
	apk --purge -v del py-pip && \
	rm /var/cache/apk/* && \
  mkdir /docker-entrypoint-initdb.d

WORKDIR /aws

VOLUME /docker-entrypoint-initdb.d/
