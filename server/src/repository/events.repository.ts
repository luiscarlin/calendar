import { pool } from './database';

export const queryAllEvents = async () => {
  return await pool.query('SELECT * FROM event').then((result) => result.rows);
};
