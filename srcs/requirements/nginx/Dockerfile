FROM debian:buster

# tmp
EXPOSE 443

# WORKDIR /home

RUN apt update
RUN apt install -y nginx openssl

COPY ./conf/nginx.conf /etc/nginx/nginx.conf

RUN echo "Starting NGINX"
CMD ["nginx", "-g  daemon off;"]
