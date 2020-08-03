require('dotenv').config();

import { Client } from 'pg';

const { DB_NAME, DB_USER, DB_PASSWORD, DB_HOST } = process.env;

export const dbClient = new Client({
  user: DB_USER,
  password: DB_PASSWORD,
  database: DB_NAME,
  host: DB_HOST,
  port: 5432,
});
