#!/bin/bash

# allow external connection
sed -ie '/bind-address/s/127.0.0.1/0.0.0.0/g' /etc/mysql/mariadb.conf.d/50-server.cnf
# sed -ie 's/port/#port/g' /etc/mysql/mariadb.conf.d/50-server.cnf


# initialize the MySQL data directory and create the system tables if they don't exist yet
if [ ! -d "/var/lib/mysql/mysql" ]; then

    mysql_install_db --user=mysql --basedir=/usr --datadir=/var/lib/mysql

fi

# start the service, run the mysql_secure_installation equivalent and set up database and privileged user
if [ ! -d "/var/lib/mysql/$MYSQL_DATABASE" ]; then

service mysql start

# Configure root password
# Deny remote root access
# Delete anonymours users
# Configure mysql and create database and user with set permissions
# Remove test database
# To unallow root access from  from a host that is not 'localhost', '127.0.0.1', or '::1'
# DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('localhost', '127.0.0.1', '::1');
# Delete "empty" users
# DELETE FROM mysql.user WHERE User='';
# DROP DATABASE IF EXISTS test;
mysql --user=root << _EOF_
UPDATE mysql.user SET Password=PASSWORD('$MYSQL_ROOT_PASSWORD') WHERE User='root';
DELETE FROM mysql.db WHERE Db='test' OR Db='test\\_%';
FLUSH PRIVILEGES;
_EOF_

chown -R mysql:mysql /var/lib/mysql

mysql -u root --password=$MYSQL_ROOT_PASSWORD << _EOF_
CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE;
CREATE USER IF NOT EXISTS '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';
GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'%';
GRANT USAGE ON *.* TO '$MYSQL_USER'@'%';
FLUSH PRIVILEGES;
_EOF_

# Needed to stop service in order to run CMD mysqld in Dockerfile
service mysql stop
fi

# TMP
# tail -f
# TMP

exec "$@"
