#!/bin/bash

yum update -y 
yum install httpd -y
echo "net.ipv6.conf.all.disable_ipv6 = 1" >> /etc/sysctl.conf
echo "net.ipv6.conf.default.disable_ipv6 = 1" >> /etc/sysctl.conf
sysctl -p
systemctl enable httpd
systemctl start httpd
