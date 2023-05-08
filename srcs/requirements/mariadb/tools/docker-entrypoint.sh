#!/bin/bash

sed -ie '/bind-address/s/127.0.0.1/0.0.0.0/g' /etc/mysql/mariadb.conf.d/50-server.cnf

chmod -R 755 /var

mysql_install_db --user=mysql --basedir=/usr --datadir=/var/lib/mysql

/etc/init.d/mysql start

# Configure mysql and create database and user with set permissions
# Delete anonymours users
# Deny remote root access
# DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('localhost', '127.0.0.1', '::1');
# Remove test database
mysql --user=root << EOF
DELETE FROM mysql.user WHERE User='';
DROP DATABASE test;
DELETE FROM mysql.db WHERE Db='test' OR Db='test\\_%';
FLUSH PRIVILEDGES;
EOF

mariadb -u root --password=$MYSQL_ROOT_PASSWORD << EOF
CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE;
CREATE USER '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';
GRANT ALL ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'%';
GRANT USAGE ON *.* TO '$MYSQL_USER'@'%';
FLUSH PRIVILEDGES;
EOF

# TMP
tail -f
# TMP

exec "$@"
