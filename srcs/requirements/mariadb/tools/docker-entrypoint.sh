#!/bin/bash

# allow external connection
# sed -ie '/bind-address/s/127.0.0.1/0.0.0.0/g' /etc/mysql/mariadb.conf.d/50-server.cnf
sed -ie 's/bind-address/#bind-address/g' /etc/mysql/mariadb.conf.d/50-server.cnf
sed -ie 's/port/#port/g' /etc/mysql/mariadb.conf.d/50-server.cnf

if [ ! -d "/var/lib/mysql/mysql" ]; then

    mysql_install_db --user=mysql --basedir=/usr --datadir=/var/lib/mysql

fi

if [ ! -d "/var/lib/mysql/$MYSQL_DATABASE" ]; then

service mysql start

# mysql_secure_installation equivalent
# Configure root password
# Configure mysql and create database and user with set permissions
# Delete anonymours users
# Deny remote root access
# Remove test database
mysql --user=root << EOF
UPDATE mysql.user SET Password=PASSWORD('$MYSQL_ROOT_PASSWORD') WHERE User='root';
DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('localhost', '127.0.0.1', '::1');
DELETE FROM mysql.user WHERE User='';
DROP DATABASE test;
DELETE FROM mysql.db WHERE Db='test' OR Db='test\\_%';
FLUSH PRIVILEGES;
EOF

chown -R 755 /var/lib/mysql


mariadb -u root --password=$MYSQL_ROOT_PASSWORD << EOF
CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE;
CREATE USER IF NOT EXISTS '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';
GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'%';
GRANT USAGE ON *.* TO '$MYSQL_USER'@'%';
FLUSH PRIVILEGES;
EOF

fi

# TMP
# tail -f
# TMP

exec "$@"
