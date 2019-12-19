#!/bin/bash
sudo yum -y install http://rpms.remirepo.net/enterprise/remi-release-7.rpm 
sudo yum -y install epel-release yum-utils
sudo yum-config-manager --disable remi-php54
sudo yum-config-manager --enable remi-php73
yum install php php-mysql -y
cd /var/www/html
wget https://wordpress.org/latest.tar.gz
tar -xzf *.tar.gz
cp -r wordpress/* /var/www/html/
rm -rf wordpress
rm -rf *.tar.gz
chmod -R 755 wp-content
chown -R apache:apache wp-content
cp wp-config-sample.php wp-config.php
sed -i 's/database_name_here/$1/g' wp-config.php
sed -i 's/username_here/$2/g' wp-config.php
sed -i 's/password_here/$3/g' wp-config.php
service httpd restart
