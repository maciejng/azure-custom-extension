#!/bin/bash

yum update -y 
echo "net.ipv6.conf.all.disable_ipv6 = 1" >> /etc/sysctl.conf
echo "net.ipv6.conf.default.disable_ipv6 = 1" >> /etc/sysctl.conf
sysctl -p
yum -y install mariadb-server  
systemctl start mariadb
systemctl enable mariadb
sleep 10s
mysqladmin -u root password $1
mysql -u root -p"$1" -e "UPDATE mysql.user SET Password=PASSWORD('$1') WHERE User='root'" > /dev/null 2>&1
mysql -u root -p"$1" -e "DELETE FROM mysql.user where User='root' and Host not in ('localhost','127.0.0.1', '::1')" > /dev/null 2>&1
mysql -u root -p"$1" -e "DELETE FROM mysql.user where User=''" > /dev/null 2>&1
mysql -u root -p"$1" -e "DELETE from mysql.db where db='test' or Db='test\_%'" > /dev/null 2>&1
mysql -u root -p"$1" -e "FLUSH PRIVILEGES" > /dev/null 2>&1
