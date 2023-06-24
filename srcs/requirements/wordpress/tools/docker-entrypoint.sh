#!/bin/bash

sed -i s/MYSQL_DATABASE/${MYSQL_DATABASE}/g /var/www/wordpress/wp-config.php
sed -i s/MYSQL_USER/${MYSQL_USER}/g /var/www/wordpress/wp-config.php
sed -i s/MYSQL_PASSWORD/${MYSQL_PASSWORD}/g /var/www/wordpress/wp-config.php
chown -R www-data:www-data /var/www/wordpress

if ! wp core is-installed --allow-root --path=/var/www/wordpress; then
    wp core install --allow-root --path=/var/www/wordpress --url=${LOGIN}.42.fr --title="inception" --admin_user=${WP_USER} --admin_email=${WP_EMAIL} --skip-email --admin_password=${WP_PASSWORD}
fi

exec "$@"
