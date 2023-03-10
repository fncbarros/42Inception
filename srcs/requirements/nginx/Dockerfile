FROM debian:buster

# tmp
EXPOSE 443

WORKDIR /etc/nginx

RUN apt update
RUN apt install -yq nginx openssl

COPY ./conf/nginx.conf /etc/nginx/conf.d/nginx.conf
COPY ./tools/entrypoint.sh /usr/local/bin

ENTRYPOINT ["entrypoint.sh"]

CMD ["nginx", "-g  daemon off;"]
