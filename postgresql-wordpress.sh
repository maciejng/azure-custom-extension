#!/bin/bash
sudo su - postgres -c "createdb $1"
sudo su - postgres -c "psql -c \"CREATE USER $2 WITH PASSWORD '$3';\""
sudo su - postgres -c "psql -c \"grant all privileges on database $1 to $2\""
echo "listen_addresses='*'" >> /var/lib/pgsql/data/postgresql.conf
echo "host all all $5 trust" >> /var/lib/pgsql/data/pg_hba.conf
service postgresql restart
