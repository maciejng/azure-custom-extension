yum install git -y
cd wp-content // go to wp-content
git clone https://github.com/kevinoid/postgresql-for-wordpress.git
mv postgresql-for-wordpress/pg4wp Pg4wp
rm -rf postgresql-for-wordpress
cp Pg4wp/db.php db.php
