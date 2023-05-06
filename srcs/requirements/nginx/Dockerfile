FROM debian:buster

RUN apt-get update
RUN apt-get install -yq nginx openssl \
    && rm -rf /var/lib/apt/lists/*
RUN apt-get autoremove

COPY ./tools/docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh

COPY ./conf/default /etc/nginx/sites-enabled/default

RUN chmod +x /usr/local/bin/docker-entrypoint.sh
WORKDIR /etc/nginx
ENTRYPOINT ["docker-entrypoint.sh"]

CMD ["nginx", "-g daemon off;"]
