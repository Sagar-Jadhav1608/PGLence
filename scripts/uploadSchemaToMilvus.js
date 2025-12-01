import { MilvusClient } from '@zilliz/milvus2-sdk-node';
import dotenv from 'dotenv';
import { pipeline } from '@xenova/transformers';
dotenv.config();

const client = new MilvusClient({
 address: "https://in03-cbdb10e3eaf676f.serverless.gcp-us-west1.cloud.zilliz.com",
  username: "db_cbdb10e3eaf676f",
  password: "Fh0?0et7EEYFfT0R",
  database: process.env.MILVUS_DB_NAME || 'default' // optional
});
const COLLECTION_NAME = 'schema_embeddings';

// const schemaChunks = [
//     // Users Table
//     'Table: users(id, name, email, created_at)',
//     'Column: users.id - unique identifier for each user',
//     'Column: users.name - name of the user',
//     'Column: users.email - email address of the user',
//     'Column: users.created_at - timestamp when the user signed up',
  
//     // Orders Table
//     'Table: orders(id, user_id, amount, created_at)',
//     'Column: orders.id - unique identifier for each order',
//     'Column: orders.user_id - references users.id, linking order to user',
//     'Column: orders.amount - total amount of the order',
//     'Column: orders.created_at - timestamp when the order was placed',
  
//     // Relationships and examples
//     'Relation: orders.user_id is a foreign key referencing users.id',
//     'Sample Query: Count total users → SELECT COUNT(*) FROM users;',
//     'Sample Query: Total orders for user 1 → SELECT SUM(amount) FROM orders WHERE user_id = 1;',
//     'Sample Query: List all users and their orders → SELECT users.name, orders.amount FROM users JOIN orders ON users.id = orders.user_id;'
//   ];
const schemaChunks = [
  // Old schema
  'Table: users(id, name, email, created_at)',
  'Table: orders(id, user_id, amount, created_at)',
  'users.id = orders.user_id (foreign key)',
  'Sample query: Get number of users → SELECT COUNT(*) FROM users;',

  // New Aluminium Plant Schema
  'Table: plants(id, name, location, capacity_tons_per_day)',
  'Table: employees(id, name, role, shift, plant_id, join_date)',
  'Table: shifts(id, employee_id, shift_start, shift_end)',
  'Table: cells(id, plant_id, cell_number, status, last_maintenance)',
  'Table: production_logs(id, cell_id, timestamp, output_tons, temperature_c, voltage, current_kA)',
  'Table: maintenance_logs(id, cell_id, employee_id, maintenance_date, remarks)',
  'Table: materials(id, name, unit, stock_quantity, last_restock)',
  'Table: material_intake_logs(id, material_id, received_quantity, received_date, supplier)',
  'Table: sensor_data(id, cell_id, timestamp, temperature, pressure, vibration_level)',

  // Relations
  'employees.plant_id → plants.id (foreign key)',
  'cells.plant_id → plants.id (foreign key)',
  'production_logs.cell_id → cells.id (foreign key)',
  'maintenance_logs.cell_id → cells.id (foreign key)',
  'maintenance_logs.employee_id → employees.id (foreign key)',
  'material_intake_logs.material_id → materials.id (foreign key)',
  'sensor_data.cell_id → cells.id (foreign key)',
  'shifts.employee_id → employees.id (foreign key)',

  // Samples (optional for LLM guidance)
  'Sample query: List all employees in Plant 3',
  'Sample query: Total aluminium output on 2025-06-25',
  'Sample query: Last maintenance notes for CELL-1003'
];


(async () => {
  // Drop if exists (optional during development)
  await client.dropCollection({ collection_name: COLLECTION_NAME }).catch(() => {});

  // Create collection with correct schema
  await client.createCollection({
    collection_name: COLLECTION_NAME,
    fields: [
      {
        name: 'id',
        data_type: 'Int64',
        is_primary_key: true,
        autoID: true
      },
      {
        name: 'value',
        data_type: 'VarChar',
        max_length: 512
      },
      {
        name: 'embedding',
        data_type: 'FloatVector',
        dim: 384
      }
    ]
  });

  const embedder = await pipeline('feature-extraction', 'Xenova/all-MiniLM-L6-v2');

  for (const chunk of schemaChunks) {
    const output = await embedder(chunk, { pooling: 'mean', normalize: true });
    const embedding = Array.from(output.data);
    await client.insert({
      collection_name: COLLECTION_NAME,
      fields_data: [{ value: chunk, embedding }]
    });
  }

  await client.flushSync({ collection_names: [COLLECTION_NAME] });
  console.log('✅ Schema chunks uploaded to Milvus');
})();
