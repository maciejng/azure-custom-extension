yum install git php-pgsql -y
git clone https://github.com/kevinoid/postgresql-for-wordpress.git
mv postgresql-for-wordpress/pg4wp /var/www/html/wp-content/pg4wp
rm -rf postgresql-for-wordpress
cp /var/www/html/wp-content/pg4wp/db.php /var/www/html/wp-content/db.php
chown apache. /var/www/html/wp-content/* -R
service httpd restart
