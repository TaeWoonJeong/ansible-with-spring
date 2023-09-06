#!/bin/bash

# Find the temporary password from the MySQL log
temp_password=$(sudo grep 'temporary password' /var/log/mysqld.log | awk '{print $NF}')

if [ -z "$temp_password" ]; then
  echo "Failed to find the temporary password in the MySQL log."
  exit 1
fi

# Log in to MySQL and change the password
mysql -u root --connect-expired-password -p"$temp_password" <<EOF
ALTER USER 'root'@'localhost' IDENTIFIED BY 'Abcd1234!';
EOF

mysql -u root -p"Abcd1234!" <<EOF
CREATE USER 'root'@'%' IDENTIFIED BY 'SpringMySQL1!';
GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' WITH GRANT OPTION;
FLUSH PRIVILEGES;
EOF

mysql -u root -p"Abcd1234!" <<EOF
CREATE DATABASE ansible;
EOF