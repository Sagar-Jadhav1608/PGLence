import pool from '../config/db.js';
export const runSQL = async (query) => {
  const { rows } = await pool.query(query);
  return rows;
};