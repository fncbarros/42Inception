FROM debian:buster

### TMP ###
EXPOSE 443
### TMP ###

WORKDIR /etc/nginx

RUN apt-get update
RUN apt-get install -yq nginx openssl \
&& rm -rf /var/lib/apt/lists/*
RUN apt-get autoremove

# COPY ./conf/nginx.conf /etc/nginx/conf.d/fbarros.conf
COPY ./tools/docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh

RUN chmod +x /usr/local/bin/docker-entrypoint.sh

ENTRYPOINT ["docker-entrypoint.sh"]

CMD ["nginx", "-g daemon off;"]
