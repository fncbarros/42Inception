#!/bin/bash

user=$MYSQL_USER
password=$MYSQL_PASSWORD
db=$MYSQL_DATABASE
host=localhost
#host='%'

# Configure mysql
mysql -u root << EOF
DELETE FROM mysql.user WHERE User=''; \ # Delete anonymours users
DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('localhost', '127.0.0.1', '::1'); \ # Deny remote root access
DROP DATABASE test;
DELETE FROM mysql.db WHERE Db='test' OR Db='test\_%'; \ # Remove test database
FLUSH PRIVILEDGES;
EOF

# Create database and user with set permissions
commands="CREATE DATABASE \`${db}\`; \
          CREATE USER '${user}'@'${host}' IDENTIFIED BY '${password}'; \
          GRANT USAGE ON *.* TO '${user}'@'${host}'; \
          GRANT ALL ON \`${db}\`.* TO '${user}'@'${host}'; \
          FLUSH PRIVILEGES;"
echo "${commands}" | /usr/bin/mysql -u root

tail -f

exec "$@"
