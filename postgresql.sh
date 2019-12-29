#!/bin/bash

yum update -y 
echo "net.ipv6.conf.all.disable_ipv6 = 1" >> /etc/sysctl.conf
echo "net.ipv6.conf.default.disable_ipv6 = 1" >> /etc/sysctl.conf
sysctl -p
yum -y install postgresql postgresql-contrib  
postgresql-setup initdb
systemctl start postgresql
systemctl enable postgresql
sleep 10s
sudo -u postgres psql -c"ALTER user postgres WITH PASSWORD '$1'"
sudo service postgresql restart
sleep 10s