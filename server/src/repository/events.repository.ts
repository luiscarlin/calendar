import { pool } from './database';

export const queryAllEvents = async () => {
  return await pool.query('SELECT * FROM public.event').then((result) => result.rows);
};
