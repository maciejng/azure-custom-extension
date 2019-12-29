#!/bin/bash
sudo su - postgres -c createdb $1
sudo -u postgres bash -c "psql -c \"CREATE USER $2 WITH PASSWORD '$3';\""
sudo -u postgres bash -c "psql -c \"grant all privileges on database $1 to $2\""

