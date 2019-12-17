#!/bin/bash
yum install php php-mysql -y
cd /var/www/html
wget https://wordpress.org/latest.tar.gz
tar -xzf wordpress-*.tar.gz
cp -r wordpress/* /var/www/html/
rm -rf wordpress
rm -rf wordpress-*.tar.gz
chmod -R 755 wp-content
chown -R apache:apache wp-content
service httpd reload
