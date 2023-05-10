#!/bin/bash

# allow external connection
# sed -ie '/bind-address/s/127.0.0.1/0.0.0.0/g' /etc/mysql/mariadb.conf.d/50-server.cnf
sed -ie '/bind-address/#bind-address/g' /etc/mysql/mariadb.conf.d/50-server.cnf
sed -ie 's/port/#port/g' /etc/mysql/mariadb.conf.d/50-server.cnf

mysql_install_db --user=mysql --basedir=/usr --datadir=/var/lib/mysql

service mysql start

# mysql_secure_installation equivalent
# Configure mysql and create database and user with set permissions
# Delete anonymours users
# Deny remote root access
# Remove test database
mysql --user=root << EOF
UPDATE mysql.user SET Password=PASSWORD('$MYSQL_ROOT_PASSWORD') WHERE User='root';
DELETE FROM mysql.user WHERE User='';
DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('localhost', '127.0.0.1', '::1');
DROP DATABASE test;
DELETE FROM mysql.db WHERE Db='test' OR Db='test\\_%';
FLUSH PRIVILEDGES;
EOF

chown -R 755 /var/lib/mysql

if [[! -d var/lib/mysql/mysql]]; then

mariadb -u root --password=$MYSQL_ROOT_PASSWORD << EOF
CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE;
CREATE USER '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';
GRANT ALL ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'%';
GRANT USAGE ON *.* TO '$MYSQL_USER'@'%';
FLUSH PRIVILEDGES;
EOF

fi

# TMP
# tail -f
# TMP

exec "$@"
