#!/bin/bash

# breaking link to default config
unlink /etc/nginx/sites-enabled/default

mkdir /etc/nginx/certs
# Generate self signed ssl certificate
openssl req -x509 -nodes -days 365 -subj "/C=PT/ST=Lisbon/O=42Lisboa/CN=fbarros.42.fr" \
 -addext "subjectAltName=DNS:fbarros.42.fr" -newkey rsa:2048 -keyout /etc/nginx/certs/fbarros.42.fr.key -out /etc/nginx/certs/fbarros.42.fr.crt

mv /default /etc/nginx/sites-enabled/

# refer to cheatsheet.txt to know why this is important
exec "$@"
