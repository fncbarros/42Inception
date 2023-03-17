FROM debian:buster

# EXPOSE 3306

RUN apt-get update
RUN apt-get install -yq mariadb-server \
&& rm -rf /var/lib/apt/lists/*
RUN apt-get autoremove
RUN mysql_install_db > /dev/null

CMD ["/etc/init.d/mysql", "start"]
