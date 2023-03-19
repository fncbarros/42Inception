FROM debian:buster

WORKDIR /var/www/

RUN apt-get update && \
    apt-get install -yq wget mariadb-client \
    php-fpm php-mysql && \
    apt-get autoremove && \
    rm -rf /var/lib/apt/lists/*
RUN wget https://wordpress.org/latest.tar.gz && \
    tar -xvf latest.tar.gz && \
    rm -rf latest.tar.gz

CMD /bin/bash
