FROM postgres

# Update container
RUN apt-get update -y
RUN apt-get install wget -y

# Add initialisation scripts
COPY src/initdb/ /docker-entrypoint-initdb.d/

WORKDIR /docker-entrypoint-initdb.d/
RUN mkdir -p ido_schema
RUN cd ido_schema

# Fetch IDO Schema
RUN wget -O /docker-entrypoint-initdb.d/ido_schema/pgsql.sql https://raw.githubusercontent.com/Icinga/icinga2/master/lib/db_ido_pgsql/schema/pgsql.sql

# Environment variables
ENV container docker
ENV PGDATA /var/lib/postgresql/data/pgdata
ENV POSTGRES_USER postgres
ENV DEBIAN_FRONTEND noninteractive
ENV POSTGRES_HOST_AUTH_METHOD trust

# Open ports
EXPOSE 5432
