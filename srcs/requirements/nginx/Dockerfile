FROM debian:buster

ENV PORT=443
EXPOSE 443

WORKDIR ${HOME}

RUN apt update
RUN apt install -y nginx

RUN echo "Starting NGINX"
CMD ["nginx"]
