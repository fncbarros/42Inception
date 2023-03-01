FROM debian:buster

# tmp
EXPOSE 443

WORKDIR /home

RUN apt update
RUN apt install -y nginx

RUN echo "Starting NGINX"
CMD ["nginx", "-g  daemon off;"]
