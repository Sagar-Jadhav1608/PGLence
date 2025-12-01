import { readFileSync } from 'fs';
import pg from 'pg';
import dotenv from 'dotenv';

dotenv.config();

const { Pool } = pg;

// ✅ PostgreSQL connection from .env
const pool = new Pool({
  connectionString: 'postgresql://user:qh6gtvzikUAchIoIIpYnxCYIMizXdQQm@dpg-d1fn917fte5s73fnfg80-a.oregon-postgres.render.com/text2sql_dvjw', // You can use full URL here
  ssl: {
    rejectUnauthorized: false // Needed for Render hosted DBs
  }
});

async function initDB() {
  try {
    const sql = readFileSync('init_smelter.sql', 'utf-8');
    await pool.query(sql);
    console.log('✅ init.sql executed successfully');
  } catch (err) {
    console.error('❌ Error running init.sql:', err);
  } finally {
    await pool.end();
  }
}

initDB();







// 🔍 General Plant Info
// What is the capacity of each plant?

// List all plants and their locations.

// Which plant has the highest production capacity?

// 👷 Employee Queries
// List all employees working at Plant 3.

// How many engineers work in Plant 5?

// Who are the supervisors in the smelter plants?

// Give the names and roles of employees who joined most recently.

// How many employees are assigned to each plant?

// 🕐 Shift Details
// What are the shift timings for employee ID 2?

// List all employees who had a shift on 2025-06-25.

// How many shifts did each employee work today?

// What is the total number of shifts at Plant 1?

// ⚡ Electrolysis Cell Details
// List all electrolysis cells in Plant 1.

// Which cells have been marked as 'active'?

// How many cells are present in each plant?

// When was the last maintenance done on CELL-1007?

// 🧪 Sensor Data
// What was the average temperature recorded for cell ID 3?

// List all sensor readings for cell 3 in the last 2 days.

// Which cells had a voltage greater than 5.0 in the past 24 hours?

// What is the maximum vibration level recorded for any cell?

// 🧯 Maintenance Logs
// What maintenance was done on CELL-1001?

// List all employees who have done maintenance work.

// Which cells had maintenance done on 2025-06-25?

// What are the notes for the last maintenance entry?

// 📦 Materials & Inventory
// List all materials along with their stock quantity.

// Which material was restocked most recently?

// What is the total stock quantity of Bauxite?

// How much quantity of each material was received by Plant 3?

// ⚙️ Production Logs
// How much aluminium was produced on 2025-06-25?

// What is the total production output from CELL-1003?