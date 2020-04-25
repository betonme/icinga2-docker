#!/bin/bash
set -e

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" <<-EOSQL
    CREATE ROLE icinga with LOGIN PASSWORD 'icinga';
    CREATE DATABASE icinga;
    GRANT ALL PRIVILEGES ON DATABASE icinga TO icinga;

    CREATE DATABASE icingaweb2;
    GRANT ALL PRIVILEGES ON DATABASE icingaweb2 TO icinga;
    
    CREATE DATABASE director WITH ENCODING 'UTF8';
    CREATE ROLE director with LOGIN PASSWORD 'director';
    GRANT ALL PRIVILEGES ON DATABASE director TO director;
    CREATE EXTENSION pgcrypto;

EOSQL

psql -U icinga -d icinga < /docker-entrypoint-initdb.d/ido_schema/pgsql.sql
