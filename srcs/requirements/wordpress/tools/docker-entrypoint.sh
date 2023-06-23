#!/bin/bash

if [ ! -e "/var/www/wordpress/wp-config.php" ]; then
    sed -i s/MYSQL_DATABASE/${MYSQL_DATABASE}/g /var/www/wordpress/wp-config.php
    sed -i s/MYSQL_USER/${MYSQL_USER}/g /var/www/wordpress/wp-config.php
    sed -i s/MYSQL_PASSWORD/${MYSQL_PASSWORD}/g /var/www/wordpress/wp-config.php
fi

if !(wp core is-installed --alow-root); then
    wp core install --path=/var/www/wordpress --allow-root --url=${LOGIN}.42.fr --title="inception" --admin_user=${MYSQL_USER} --admin_email=${WP_EMAIL} --admin_password=${MYSQL_PASSWORD}
    wp user create --path=/var/www/wordpress --allow-root ${MYSQL_USER} ${WP_EMAIL} --user_pass=${MYSQL_PASSWORD}
fi

exec "$@"
