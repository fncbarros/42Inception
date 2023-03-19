#!/bin/bash

user=$MYSQL_USER
password=$MYSQL_PASSWORD
db=$MYSQL_DATABASE
host=localhost
#host='%'

# Start the secure installation
<< EOF

Y
Y
Y
Y
EOF | mysql_secure_installation

# Create database and user with set permissions
commands="CREATE DATABASE \`${db}\`; \
          CREATE USER '${user}'@'${host}' IDENTIFIED BY '${password}'; \
          GRANT USAGE ON *.* TO '${user}'@'${host}'; \
          GRANT ALL ON \`${db}\`.* TO '${user}'@'${host}'; \
          FLUSH PRIVILEGES;"
echo "${commands}" | /usr/bin/mysql -u root -p

exec "$@"