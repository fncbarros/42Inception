#!/bin/bash

sed -i "s/MYSQL_DATABASE/$MYSQL_DATABASE/g" /etc/php/7.3/fpm/pool.d/www.conf
sed -i "s/MYSQL_USER/$MYSQL_USER/g" /etc/php/7.3/fpm/pool.d/www.conf
sed -i "s/MYSQL_PASSWORD/$MYSQL_PASSWORD/g" /etc/php/7.3/fpm/pool.d/www.conf

exec "$@
