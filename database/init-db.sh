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
  CREATE TABLE public.event (
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
  (1, 'Lucho', 'Carlone', now(), now(), null),
  (2, 'Jim', 'Jimenez', now(), now(), null),
  (3, 'Sebastian', 'Wacawaca', now(), now(), null);
EOSQL


psql -v ON_ERROR_STOP=1 --username $DB_USER --dbname $DB_NAME <<-EOSQL
  INSERT INTO public.event VALUES
  (1, 1, 'Run', 'Go run 5K with frieds', now(), now() + interval '1 hour', now(), now(), null),
  (2, 2, 'Soccer', 'Go to the park and play some soccer with friends', now() + interval '1 hour', now() + interval '2 hour', now(), now(), null),
  (3, 3, 'Tennis', 'Play Tennis', now() + interval '3 hour', now() + interval '4 hour', now(), now(), null),
  (4, 3, 'Ping Ping', 'Play Ping Pong', now() + interval '5 hour', now() + interval '6 hour', now(), now(), null);
EOSQL