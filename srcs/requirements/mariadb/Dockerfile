FROM debian:buster

EXPOSE 3306

RUN apt-get update
RUN apt-get install -yq mariadb-server \
&& rm -rf /var/lib/apt/lists/*
RUN apt-get autoremove
RUN mysql_install_db > /dev/null

COPY ./tools/docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh

RUN chmod +x /usr/local/bin/docker-entrypoint.sh

ENTRYPOINT ["docker-entrypoint.sh"]

# CMD ["/etc/init.d/mysql", "start"]
