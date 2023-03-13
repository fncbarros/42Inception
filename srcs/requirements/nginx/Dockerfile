FROM debian:buster

# tmp
EXPOSE 443

WORKDIR /etc/nginx

RUN apt update
RUN apt install -yq nginx openssl

# COPY ./conf/nginx.conf /etc/nginx/conf.d/fbarros.conf
COPY ./tools/docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh

RUN chmod +x /usr/local/bin/docker-entrypoint.sh

ENTRYPOINT ["docker-entrypoint.sh"]

CMD ["nginx", "-g daemon off;"]
