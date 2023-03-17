FROM debian:buster

RUN apt-get update
RUN apt-get install -yq wordpress mariadb-client \
&& rm -rf /var/lib/apt/lists/*
RUN apt-get autoremove
