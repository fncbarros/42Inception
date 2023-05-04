FROM debian:buster

RUN apt-get update \
    && apt-get install -y apt-transport-https gnupg2 wget
RUN wget -O - https://mariadb.org/mariadb_release_signing_key.asc | apt-key add - \
    && echo "deb [arch=amd64,arm64,ppc64el] http://mirror.mva-n.net/mariadb/repo/10.5/debian buster main" > /etc/apt/sources.list.d/mariadb.list
RUN apt-get update \
    && apt-get install -y mariadb-server
RUN rm -rf /var/lib/apt/lists/* \
    && apt-get autoremove

COPY ./tools/docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh

RUN chmod +x /usr/local/bin/docker-entrypoint.sh

ENTRYPOINT ["docker-entrypoint.sh"]

# bind to 0.0.0.0 to allow external connection
CMD ["/etc/init.d/mysql", "start", "--bind=0.0.0.0"]
