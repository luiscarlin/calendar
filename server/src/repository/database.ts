import { Pool } from 'pg';

require('dotenv').config();

const { DB_NAME, DB_USER, DB_PASSWORD, DB_HOST } = process.env;

export const pool = new Pool({
  user: DB_USER,
  password: DB_PASSWORD,
  database: DB_NAME,
  host: DB_HOST,
  port: 5432,
});
