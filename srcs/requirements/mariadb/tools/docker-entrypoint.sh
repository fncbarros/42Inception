#!/bin/bash

user=$MYSQL_USER
password=$MYSQL_PASSWORD
root_password=$MYSQL_ROOT_PASSWORD
db=$MYSQL_DATABASE
host='%'

# sed -ie '/bind-address/s/127.0.0.1/0.0.0.0/g' /etc/mysql/mariadb.conf.d/50-server.cnf

mysql_install_db --user=mysql

/etc/init.d/mariadb start

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

mariadb -u root --password=${root_password} << EOF
CREATE DATABASE \`${db}\`;
CREATE USER '${user}'@'${host}' IDENTIFIED BY '${password}';
GRANT ALL ON \`${db}\`.* TO '${user}'@'${host}';
GRANT USAGE ON *.* TO '${user}'@'${host}';
FLUSH PRIVILEDGES;
EOF

# TMP
tail -f
# TMP

exec "$@"
