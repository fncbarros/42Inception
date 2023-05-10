FROM debian:buster

RUN apt-get update \
    && apt-get install -y mariadb-server \
    && apt-get upgrade -y
RUN rm -rf /var/lib/apt/lists/* \
    && apt-get autoremove

RUN mkdir -p /var/lib/mysql

COPY ./tools/docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh

RUN chmod +x /usr/local/bin/docker-entrypoint.sh

ENTRYPOINT ["docker-entrypoint.sh"]

CMD ["mysqld_safe", "--bind-address=0.0.0.0", "--datadir='/var/lib/mysql'"]
