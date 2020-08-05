#!/bin/bash
set -e

psql -v ON_ERROR_STOP=1 --username $POSTGRES_USER --dbname $POSTGRES_DB <<-EOSQL
  CREATE USER $DB_USER WITH ENCRYPTED PASSWORD '$DB_PASSWORD';
  CREATE DATABASE $DB_NAME;
  GRANT ALL PRIVILEGES ON DATABASE $DB_NAME TO $DB_USER;
EOSQL

psql -v ON_ERROR_STOP=1 --username $DB_USER --dbname $DB_NAME <<-EOSQL
  CREATE TABLE public.user (
    id SERIAL PRIMARY KEY,
    first_name VARCHAR NOT NULL,
    last_name VARCHAR NOT NULL,
    date_created TIMESTAMP,
    date_modified TIMESTAMP,
    date_deleted TIMESTAMP
  );
EOSQL

psql -v ON_ERROR_STOP=1 --username $DB_USER --dbname $DB_NAME <<-EOSQL
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

psql -v ON_ERROR_STOP=1 --username $DB_USER --dbname $DB_NAME <<-EOSQL
  INSERT INTO public.user VALUES
  (1, 'luis', 'carlon', '1999-01-08 04:05:06', '1999-01-08 04:05:06', '1999-01-08 04:05:06'),
  (2, 'jim', 'jimenez', '1999-01-08 04:05:06', '1999-01-08 04:05:06', '1999-01-08 04:05:06'),
  (3, 'hey', 'you', '1999-01-08 04:05:06', '1999-01-08 04:05:06', '1999-01-08 04:05:06');
EOSQL


