FROM debian:buster

RUN apt-get update
RUN apt-get install -yq wordpress mariadb-client \
php-fpm php-mysql \
&& rm -rf /var/lib/apt/lists/*
RUN apt-get autoremove
