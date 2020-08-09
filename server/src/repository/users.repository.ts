import { pool } from './database';

export const queryAllUsers = async () => {
  return await pool.query('SELECT * FROM public.user').then((result) => result.rows);
};
