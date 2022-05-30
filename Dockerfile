FROM joomla:php7.4-apache

LABEL maintainer="help@websoft9.com"
LABEL version="Discuz_X3.4_SC_UTF8_20220518"
LABEL description="Discuz"

ENV DISCUZ_DB_HOST=mysql
ENV DISCUZ_DB_USER=discuz
ENV DISCUZ_DB_PASSWORD=discuz
ENV DISCUZ_DB_DATABASE=discuz


ARG INSTALL_DIR /var/www/html

RUN apt-get update && apt-get upgrade -y && apt install unzip zip -y; \
    rm -rf /var/lib/apt/lists/* ; \
    rm -rf /var/www/html/*

COPY ./src/Discuz_X* $INSTALL_DIR
COPY entrypoint.sh /entrypoint.sh

RUN unzip Discuz_* -d /var/www/html/unzip; \
    cp -r unzip/upload/* $INSTALL_DIR; \
    chmod -R 777 $INSTALL_DIR; \
    rm -rf Discuz_* unzip
    chmod +x /entrypoint.sh
