FROM alpine:latest

MAINTAINER MOD <navarro.mod@gmail.com>

ENV RESTORE_DB_CHARSET utf8
ENV RESTORE_DB_COLLATION utf8_bin

RUN apk -Uu add mysql-client bash tzdata groff less python py-pip

RUN \
	mkdir -p /aws && \
	pip install awscli && \
	apk --purge -v del py-pip && \
	rm /var/cache/apk/*

WORKDIR /aws

ADD backup_script.sh /start.sh

RUN chmod +x /start.sh

ENTRYPOINT ["/start.sh"]
