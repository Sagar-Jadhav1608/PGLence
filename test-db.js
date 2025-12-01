import pg from 'pg';

const pool = new pg.Pool({
  host: 'localhost',
  port: 5433,
  user: 'user',
  password: 'password',
  database: 'text2sql',
});

(async () => {
  try {
    const res = await pool.query('SELECT NOW()');
    console.log('✅ Connected to Postgres:', res.rows[0]);
  } catch (err) {
    console.error('❌ Failed to connect:', err.message);
  } finally {
    await pool.end();
  }
})();
