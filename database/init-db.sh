#!/bin/bash
set -e

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
  CREATE USER $DB_USER WITH ENCRYPTED PASSWORD '$DB_PASSWORD';
  CREATE DATABASE $DB_NAME;
  GRANT ALL PRIVILEGES ON DATABASE $DB_NAME TO $DB_USER;
EOSQL

psql -v ON_ERROR_STOP=1 --username "$DB_USER" --dbname "$DB_PASSWORD" <<-EOSQL
  DROP TABLE IF EXISTS user;
  DROP TABLE IF EXISTS event;
EOSQL

psql -v ON_ERROR_STOP=1 --username "$DB_USER" --dbname "$DB_PASSWORD" <<-EOSQL
  CREATE TABLE user (
    id SERIAL PRIMARY KEY,
    first_name VARCHAR NOT NULL,
    last_name VARCHAR NOT NULL,
    date_created TIMESTAMP,
    date_modified TIMESTAMP,
    date_deleted TIMESTAMP
  );
EOSQL

psql -v ON_ERROR_STOP=1 --username "$DB_USER" --dbname "$DB_PASSWORD" <<-EOSQL
  CREATE TABLE event (
    id SERIAL PRIMARY KEY,
    user_id INTEGER NOT NULL REFERENCES "user"(id),
    title VARCHAR NOT NULL,
    description VARCHAR,
    start_date TIMESTAMP NOT NULL,
    end_date TIMESTAMP NOT NULL,
    date_created TIMESTAMP,
    date_modified TIMESTAMP ,
    date_deleted TIMESTAMP
  );
EOSQL