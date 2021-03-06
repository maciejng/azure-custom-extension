#!/bin/bash
mysql -u root -p$4 <<-EOF
CREATE DATABASE $1;
CREATE USER '$2'@'localhost' IDENTIFIED BY '$3';
CREATE USER '$2'@'%' IDENTIFIED BY '$3';
GRANT ALL PRIVILEGES ON $1.* TO '$2'@'localhost' IDENTIFIED BY '$3';
GRANT ALL PRIVILEGES ON $1.* TO '$2'@'%' IDENTIFIED BY '$3';
FLUSH PRIVILEGES;
EOF
