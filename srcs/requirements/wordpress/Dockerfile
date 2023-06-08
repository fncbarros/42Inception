FROM debian:buster

WORKDIR /var/www/

RUN apt-get update \
    && apt-get upgrade -yq \
    && apt-get install -yq wget openssl mariadb-client php php-fpm php-mysqli php-curl php-gd php-xml php-cgi php-http

RUN apt-get autoremove \
    && rm -rf /var/lib/apt/lists/*
RUN wget https://wordpress.org/latest.tar.gz \
    && tar -xvf latest.tar.gz \
    && rm -rf latest.tar.gz

COPY conf/www.conf /etc/php/7.3/fpm/pool.d/www.conf

RUN mkdir /run/php/ \
    && touch /run/php/php7.3-fpm.pid

RUN chown -R 1000:1000 /var/www
RUN chmod -R 777 /var/www

CMD ["php-fpm7.3", "-F", "-R"]
