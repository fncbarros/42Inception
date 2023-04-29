FROM debian:buster

### TMP ###
EXPOSE 3306

ENV MYSQL_DATABASE=wordpress
ENV MYSQL_USER=fbarros
ENV MYSQL_PASSWORD=secret
ENV MYSQL_ROOT_PASSWORD=secret
### TMP ###

RUN apt-get update
RUN apt-get install -yq mariadb-server \
&& rm -rf /var/lib/apt/lists/*
RUN apt-get autoremove

COPY ./tools/docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh

RUN chmod +x /usr/local/bin/docker-entrypoint.sh

ENTRYPOINT ["docker-entrypoint.sh"]

# bind to 0.0.0.0 to allow external connection
CMD ["/etc/init.d/mysql", "start", "--bind=0.0.0.0"] 
