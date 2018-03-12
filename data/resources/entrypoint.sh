#!/bin/bash

envsubst  '${SRC_PATH} ${MYSQL_USER} ${MYSQL_PASSWORD} ${MYSQL_HOST} ${MYSQL_DATABASE} ${SECRET_KEY}' < ampache.cfg.php.dist.tmpl > ${SRC_PATH}/config/ampache.cfg.php
