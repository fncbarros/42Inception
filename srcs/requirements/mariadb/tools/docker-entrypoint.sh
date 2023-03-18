#!/bin/bash

<< EOF | mysql_secure_installation

Y
Y
Y
Y
EOF

exec "$@"
